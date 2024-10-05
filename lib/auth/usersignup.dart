import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product/Service/authcls.dart';
import 'package:product/user/addprofile.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  AuthService ser=AuthService();
  final emailController=TextEditingController();
    final passwordController=TextEditingController();
      final phnController=TextEditingController();
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
          TextFormField(
            controller: phnController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.black)
              ),
              hintText: "Phone number"
            ),
          ),SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            signup();

          }, child: Text("SignUp"))
        ],
      ),
    );
  }
  Future signup()async{
  String email=emailController.text;
   String password=passwordController.text;
   User? user=await ser.signupWithEmailAndPassword(email, password);
   print('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
   print(user);
   if(user!=null){
    print("Signup successfully");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProfile()));
   }
   else{
    print("some error occure");
   }

}
}
