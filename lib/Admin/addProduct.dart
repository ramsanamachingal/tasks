import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product/Service/product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final nameController = TextEditingController();
ProductClass pro=ProductClass();
  final PriceController = TextEditingController();
  final Reference _fireStorage = FirebaseStorage.instance.ref().child('image');
  String unqImg = DateTime.now().microsecondsSinceEpoch.toString();
  String? imageUrl;
  File? selectedImage;
Future<void>_pickedImageGallery()async{
    final pickedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage == null)return;
    setState(() {
      selectedImage=File(pickedImage.path);
    });
  }
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
                    image: DecorationImage(
                        image:
                        selectedImage != null
               ? FileImage(selectedImage!)
                         :const AssetImage(
                            "assets/c27eb77c278f37d9a204bff5a661b83b.jpg")
                            as ImageProvider,
                        fit: BoxFit.cover)),
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
                  controller: nameController,
                  // controller: passwordController,
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
                  controller: PriceController,
                  // controller: passwordController,
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
                  if(selectedImage!=null){
                          Reference referenceImageToUpload=_fireStorage.child(unqImg);
                          try{
                            await referenceImageToUpload.putFile(selectedImage!);
                            imageUrl=await referenceImageToUpload.getDownloadURL();
                          }
                          catch(e){
                            print(e);
                          }
                        }
                        pro.productdata( nameController.text, PriceController.text, imageUrl.toString());
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
