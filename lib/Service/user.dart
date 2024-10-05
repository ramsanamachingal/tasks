import 'package:cloud_firestore/cloud_firestore.dart';

class UserClass{
  FirebaseFirestore fire=FirebaseFirestore.instance;
  Future userdata(String id,String name,String email,String image)async{
Map<String,dynamic> user={
"id":id,
"name":name,
"email":email,
"image":image
};
fire.collection("user").doc(id).set(user);
  }
}