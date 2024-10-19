import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List cartItems = [];

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  Future<void> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCart = prefs.getStringList('cart');
    if (savedCart != null) {
      setState(() {
        cartItems = savedCart.map((item) => json.decode(item)).toList();
      });
    }
  }

  double getTotalPrice() {
    return cartItems.fold(0.0, (sum, item) => sum + item['price']);
  }

  void removeFromCart(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartItems.removeAt(index);
    List<String> updatedCart = cartItems.map((item) => json.encode(item)).toList();
    await prefs.setStringList('cart', updatedCart);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.network(item['image'], width: 50, height: 50),
                        title: Text(item['title']),
                        subtitle: Text('\$${item['price']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => removeFromCart(index),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Total: \$${getTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
    );
  }
}
