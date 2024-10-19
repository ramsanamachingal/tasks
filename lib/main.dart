// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:product/task2/screens/reg.dart';
import 'package:product/task2/provider/userprovider.dart';
import 'package:product/task3/screen/home.dart';



// import 'package:product/firebase_options.dart';

// import 'package:product/user/userproduct.dart';
import 'package:provider/provider.dart';

// Future<void>
 void main() {
  //  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp( MyApp());
}
//task2......................................................................
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => UserProvider(),
//       child: MaterialApp(
//         title: 'User List App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const RegistrationPage(),
//       ),
//     );
//   }
// }
//task3......................................................
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

