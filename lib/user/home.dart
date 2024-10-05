import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:product/user/detail.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? selectedImage;
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('Product').get(),
        builder: (context, snapshot) {
          final allproduct = snapshot.data!.docs;
          //  String imageUrl=allproduct['image'] as Map<String,dynamic>;
          print('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
          print(allproduct.length);
          print(allproduct);

          return GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemCount: allproduct.length,
              itemBuilder: (context, index) {
                print(
                    '[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]');
                final singleDress = allproduct[index];
                final docid = allproduct[index].id;
                String imageUrl = singleDress['image'];
                print(imageUrl);
                print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
                return GestureDetector(
                  onTap: () {
                    // final docid = allproduct[index].id;
                    print(allproduct[index].id);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailPage(docid: docid,)));
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: imageUrl == ''
                          ? AssetImage(
                                  "assets/c27eb77c278f37d9a204bff5a661b83b.jpg")
                              as ImageProvider
                          : NetworkImage(imageUrl),fit: BoxFit.cover
                    )),
                  ),
                );
              });
        },
      ),
    );
  }
//    Future fetchData()async{
//   print('0000000000000000000000000000000000000000000000');
//   List ab=[];
// QuerySnapshot snapshotp = await FirebaseFirestore.instance.collection('Product').get();
// for(var doc in snapshotp.docs){
//  Map data = {
//      "Product name" : doc['Product name'],
//      "image" : doc['image'],
//      "price" : doc['price'],
//      "id" : doc.id,
//     //  "userid":doc['id']

//  };

// }

// return ab;
// }
}
