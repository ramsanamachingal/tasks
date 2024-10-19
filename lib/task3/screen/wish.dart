
import 'package:flutter/material.dart';


class WishlistScreen extends StatefulWidget {
  final List<int> wishlist;
  final List products;

  WishlistScreen({required this.wishlist, required this.products});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<int> wishlist = [];

  void toggleWishlist(int productId) {
    setState(() {
      if (wishlist.contains(productId)) {
        wishlist.remove(productId);
      } else {
        wishlist.add(productId);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize wishlist if necessary, e.g., from SharedPreferences
    wishlist = List.from(widget.wishlist); // Start with the initial wishlist
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: wishlist.isEmpty
          ? Center(child: Text('Your wishlist is empty.'))
          : ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final productId = wishlist[index];
                final product = widget.products.firstWhere((p) => p['id'] == productId);

                return ListTile(
                  leading: Image.network(product['image'], width: 50, fit: BoxFit.cover),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['title']),
                      Text('\$${product['price']}'),
                    ],
                  ),
                  subtitle: IconButton(
                    onPressed: () => toggleWishlist(productId), // Use productId here
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
