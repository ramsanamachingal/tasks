import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product/Admin/addproduct.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  FirebaseFirestore fire=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: fire.collection('Product').snapshots(),
        builder: (context, snapshot) {
           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No user profiles found',
                      style: GoogleFonts.pacifico(color: Colors.black),
                    ),
                  );
                }
                final allproduct = snapshot.data!.docs;
                
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: allproduct.length,
                    itemBuilder: (context, index) {
                       final oneprdct =
                            allproduct[index].data() as Map<String, dynamic>;
                             final String imageUrl =
                            oneprdct['image'] ?? ''; 


                      return Column(
                        children: [
                          Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                                // color: Colors.amber
                                // image: DecorationImage(
                                //     image: AssetImage(
                                //         "assets/c27eb77c278f37d9a204bff5a661b83b.jpg"),fit: BoxFit.cover)
                                ),
                            child:  Row(
                              children: [
                                const SizedBox(width: 10,),
                                CircleAvatar(
                                  backgroundImage:
                                  imageUrl==''
                                  ? const AssetImage(
                                      "assets/c27eb77c278f37d9a204bff5a661b83b.jpg")
                                      as ImageProvider
                                      :NetworkImage(imageUrl),
                                      radius: 60,
                                ),
                                const SizedBox(width: 10,),
                                 Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(oneprdct['Product name']),
                                      Text(oneprdct['price'])
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    }),
              )
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddProduct()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
