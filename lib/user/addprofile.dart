import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product/Service/user.dart';
import 'package:product/user/home.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  UserClass us=UserClass();
  final nameController=TextEditingController();
   final Reference _fireStorage=FirebaseStorage.instance.ref().child('image');
  String unqImg=DateTime.now().microsecondsSinceEpoch.toString();
  String? imageUrl;
  File? selectedImage;
   final emailController=TextEditingController();
   final currentid=FirebaseAuth.instance.currentUser!.uid;
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
      body: Column(children: [
        
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(7),
            image:
             DecorationImage(image: selectedImage != null
             ? FileImage(selectedImage!)
             :AssetImage("assets/c27eb77c278f37d9a204bff5a661b83b.jpg")
             as ImageProvider<Object>,fit: BoxFit.cover
             )
          ),
          child: IconButton(onPressed: _pickedImageGallery, icon: Icon(Icons.add)),
        ),
        TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.black)
              ),
              hintText: "name"
            ),
          ),SizedBox(height: 10,),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),borderSide: BorderSide(color: Colors.black)
              ),
              hintText: "email"
            ),
          ),SizedBox(height: 30,),
          ElevatedButton(onPressed: ()async{
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
            us.userdata(currentid, nameController.text, emailController.text, imageUrl.toString());
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

          }, child: Text("Submit"))
      ],),
    );
  }
}