import 'package:cloud_firestore/cloud_firestore.dart';

class ProductClass{
   FirebaseFirestore fire=FirebaseFirestore.instance;
  Future productdata(String name,String price,String image)async{
Map<String,dynamic> pro={
// "id":id,
"Product name":name,
"price":price,
"image":image
};
fire.collection("Product").add(pro);
  }
}