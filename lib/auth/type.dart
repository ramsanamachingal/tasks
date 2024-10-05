import 'package:flutter/material.dart';
import 'package:product/auth/userlogin.dart';
import 'package:product/auth/usersignup.dart';

class TypePage extends StatefulWidget {
  const TypePage({super.key});

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserLogin()));
          }, child: const Text("Login")),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserSignUp()));
          }, child: const Text("SignUp")),
        ],
      ),
    );
  }
}