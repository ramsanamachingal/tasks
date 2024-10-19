import 'dart:convert';import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailScreen extends StatefulWidget {
  final dynamic product;

  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Future<void> addToCart(product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('cart') ?? [];
    cartItems.add(json.encode(product));
    await prefs.setStringList('cart', cartItems);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart')));
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['image'], height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16.0),
            Text(product['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16.0),
            Text('\$${product['price']}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16.0),
            Text(product['description']),
            const Spacer(),
            ElevatedButton(
              onPressed: () => addToCart(product),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
