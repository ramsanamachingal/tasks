import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(user['avatar']),
            ),
            const SizedBox(height: 16),
            Text(
              '${user['first_name']} ${user['last_name']}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(user['email'], style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}