import 'package:flutter/material.dart';
import 'package:product/Admin/viewproduct.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final emailController=TextEditingController();
    final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),borderSide: const BorderSide(color: Colors.black)
              ),
              hintText: "Email"
            ),
          ),
          const SizedBox(height: 30,),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),borderSide: const BorderSide(color: Colors.black)
              ),
              hintText: "Password"
            ),
          ),const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            login();

          }, child: const Text("Login"))
        ],
      ),
    );
  }
  login(){
    var username="ramsana@gmail.com";
    // var password=123456;
    var enteredname= emailController.text;
    // var eneteredpass = passwordController.text;
    bool chck = username == enteredname;
    print(chck);
    if(chck){

      print('successssssssssssssss');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewProduct()));
    }
  }
}