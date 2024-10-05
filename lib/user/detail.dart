import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String docid;
  const DetailPage({super.key,required this.docid, });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Product').doc(widget.docid).snapshots(),
        builder: (context, snapshot) {
            print('////////////////////////////');
          print(widget.docid);
          final oneproduct=snapshot.data;
          final imageUrl=oneproduct?['image'];
          print(oneproduct);
          print('////////////////////////////');
          return Center(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration:  BoxDecoration(
                          image: DecorationImage(
                        image: imageUrl == ''
                            ? AssetImage(
                                    "assets/c27eb77c278f37d9a204bff5a661b83b.jpg")
                                as ImageProvider
                            : NetworkImage(imageUrl),fit: BoxFit.cover
                      )),),
                      Text(oneproduct?['Product name']),
                      Text(oneproduct?['price']),

              ],
              
            ),
          );
        }
      ),
    );
  }
}