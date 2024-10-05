import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product/Service/authcls.dart';
import 'package:product/user/home.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
   final emailController=TextEditingController();
     final passwordController=TextEditingController();
     AuthService ser=AuthService();
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.black)
              ),
              hintText: "Email"
            ),
          ),
          SizedBox(height: 30,),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.black)
              ),
              hintText: "Password"
            ),
          ),SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            login();

          }, child: Text("Login"))
        ],
      ),
    );
    
  }
 Future login()async{
  String email=emailController.text;
   String password=passwordController.text;
   User? user=await ser.signinWithEmailAndPassword(email, password);
   if(user!=null){
    print("login successfully");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
   }
   else{
    print("some error occure");
   }

} 
}