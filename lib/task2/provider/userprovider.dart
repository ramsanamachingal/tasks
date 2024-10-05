import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  List<dynamic> _users = [];
  List<dynamic> get users => _users;

  Future<bool> registerUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/register'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

   

  // Fetch users from API
  Future<void> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));

      // Debug log to verify the API response
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _users = data['data'];
        print('Fetched Users: ${_users.length}'); // Debug log for user list length
        notifyListeners(); // Update the UI
      } else {
        throw Exception('Failed to load users');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Error fetching users');
    }
  }
}