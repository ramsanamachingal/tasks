// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyArAOKmcCrDrB3X5oG9fs_CrDNcv9S6MSc',
    appId: '1:593708150072:web:fde444878fd92ecd1f65cd',
    messagingSenderId: '593708150072',
    projectId: 'product-3c225',
    authDomain: 'product-3c225.firebaseapp.com',
    storageBucket: 'product-3c225.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgHEHfvCSwCWBxEr90sxKwIddI89zCmLw',
    appId: '1:593708150072:android:a502b9cd1dbfe0351f65cd',
    messagingSenderId: '593708150072',
    projectId: 'product-3c225',
    storageBucket: 'product-3c225.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIPg8cBCUao0DI8iqjtkw3otTH5eWizMQ',
    appId: '1:593708150072:ios:c8bc750b4ee4f5d41f65cd',
    messagingSenderId: '593708150072',
    projectId: 'product-3c225',
    storageBucket: 'product-3c225.appspot.com',
    iosBundleId: 'com.example.product',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIPg8cBCUao0DI8iqjtkw3otTH5eWizMQ',
    appId: '1:593708150072:ios:c8bc750b4ee4f5d41f65cd',
    messagingSenderId: '593708150072',
    projectId: 'product-3c225',
    storageBucket: 'product-3c225.appspot.com',
    iosBundleId: 'com.example.product',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyArAOKmcCrDrB3X5oG9fs_CrDNcv9S6MSc',
    appId: '1:593708150072:web:d7c667533845e92c1f65cd',
    messagingSenderId: '593708150072',
    projectId: 'product-3c225',
    authDomain: 'product-3c225.firebaseapp.com',
    storageBucket: 'product-3c225.appspot.com',
  );
}
