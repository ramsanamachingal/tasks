import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProduct extends StatefulWidget {
  const UserProduct({super.key});

  @override
  State<UserProduct> createState() => _UserProductState();
}

class _UserProductState extends State<UserProduct> {
  final pronmController=TextEditingController();
  final priceController=TextEditingController();
  final currentuid=FirebaseAuth.instance.currentUser!.uid;
  String? imageUrl;
  File?selectedImage;
  // final Reference _fireStorage=FirebaseStorage.instance.ref().child('image');
  final uniqueImage=DateTime.now().microsecondsSinceEpoch.toString();
  Future<void>_pickedImageGallery()async{
    final pickedImage=
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage==null)return;
    setState(() {
      selectedImage=File(pickedImage.path);
    });
  }
  UserProduct pro=UserProduct();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    // color: Colors.amber
                    image: DecorationImage(
                        image:
                        imageUrl==''
                         ?const AssetImage(
                            "assets/35cff69400a0854be6d3e79e11f2da11.jpg")
                            as ImageProvider
                            :NetworkImage(imageUrl.toString()),
                        fit: BoxFit.cover)
                        ),
                child: IconButton(
                    onPressed: _pickedImageGallery,
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                
                  controller: pronmController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: Colors.black)),
                      hintText: "Product name"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                 
                   controller: priceController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: Colors.black)),
                      hintText: "Price"),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(onPressed: () async{
        
                       
          Navigator.pop(context);
              }, 
              
              child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}