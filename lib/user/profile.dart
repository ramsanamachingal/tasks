import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentuid=FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('user').doc(currentuid).snapshots(),
          builder: (context, snapshot) {
            final userdata=snapshot.data;
           String imageUrl=userdata?['image'];
            return  Column(children: [
              SizedBox(height: 40,),
              CircleAvatar(radius: 90,backgroundImage:
               imageUrl == ''
               ?AssetImage("assets/c27eb77c278f37d9a204bff5a661b83b.jpg",)
               as ImageProvider
               :NetworkImage(imageUrl),),
              Text(userdata?['name']),
              Text(userdata?['email'])
            ],);
          }
        ),
      ),
    );
  }
}