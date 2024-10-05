import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product/task2/provider/userprovider.dart';
import 'package:product/task2/screens/userdetail.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();

    // Fetch the users only once when the widget is initialized
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.fetchUsers(); // Trigger the fetch
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: userProvider.users.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Show loading while fetching users
          : ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];

                // Debug log to verify that data is rendering properly in the list
                print('Rendering User: ${user['first_name']} ${user['last_name']}');

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar']),
                  ),
                  title: Text('${user['first_name']} ${user['last_name']}'),
                  subtitle: Text(user['email']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailPage(user: user),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
