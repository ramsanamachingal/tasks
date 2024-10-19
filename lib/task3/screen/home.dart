import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:product/task3/screen/cart.dart';
import 'package:product/task3/screen/product.dart';
import 'package:product/task3/screen/wish.dart';
// import 'package:product/task3/screen/wishlist.dart'; // Import your wishlist screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List products = [];
  List filteredProducts = [];
  List<int> wishlist = []; // List to hold the indices of products in the wishlist
  String searchQuery = '';
  String selectedCategory = 'All';
  String selectedPriceOrder = 'All'; // Correct variable for price sorting
  List<String> categories = ['All', 'electronics', 'jewelery', 'men\'s clothing', 'women\'s clothing'];
  List<String> prices = ['All', 'High to Low', 'Low to High'];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
        filteredProducts = products;
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  void filterProducts() {
    setState(() {
      filteredProducts = products.where((product) {
        final productTitle = product['title'].toLowerCase();
        final productCategory = product['category'].toLowerCase();
        final isInCategory = selectedCategory == 'All' || productCategory == selectedCategory;
        final matchesSearch = searchQuery.isEmpty || productTitle.contains(searchQuery.toLowerCase());
        return isInCategory && matchesSearch;
      }).toList();

      // Apply price sorting after filtering
      filterProductsPrice();
    });
  }

  void filterProductsPrice() {
    setState(() {
      if (selectedPriceOrder == 'High to Low') {
        filteredProducts.sort((a, b) => b['price'].compareTo(a['price']));
      } else if (selectedPriceOrder == 'Low to High') {
        filteredProducts.sort((a, b) => a['price'].compareTo(b['price']));
      }
    });
  }

  // Function to toggle wishlist status
  void toggleWishlist(int productId) {
    setState(() {
      if (wishlist.contains(productId)) {
        wishlist.remove(productId);
      } else {
        wishlist.add(productId);
      }
    });
  }

 
  bool isInWishlist(int productId) {
    return wishlist.contains(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen(wishlist: wishlist, products: products)));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Search'),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  filterProducts();
                });
              },
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                      filterProducts();
                    });
                  },
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: selectedPriceOrder, // Use the correct variable here
                  onChanged: (value) {
                    setState(() {
                      selectedPriceOrder = value!;
                      filterProductsPrice(); // Filter products by price
                    });
                  },
                  items: prices.map((price) {
                    return DropdownMenuItem<String>(
                      value: price,
                      child: Text(price),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: filteredProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                final isFavorite = isInWishlist(product['id']); // Check if the product is in the wishlist

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(product['image'], height: 100, fit: BoxFit.cover),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(product['title'], maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('\$${product['price']}', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            toggleWishlist(product['id']); // Toggle wishlist status
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
