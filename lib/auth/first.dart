import 'package:flutter/material.dart';
import 'package:product/Admin/viewproduct.dart';

import 'package:product/auth/type.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Are you a ?"),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewProduct()));
          }, child: const Text("Admin")),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const TypePage()));
          }, child: const Text("user")),
        ],
      ),
    );
  }
}