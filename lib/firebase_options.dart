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
    apiKey: 'AIzaSyCawCB5qaVbipIpZGvUJH3LBsDeV1QauFk',
    appId: '1:263737104395:web:f48b96c50182e809d94f0e',
    messagingSenderId: '263737104395',
    projectId: 'e-pingo',
    authDomain: 'e-pingo.firebaseapp.com',
    storageBucket: 'e-pingo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDr6BsY5MdVLb18qe2cE0DO4WIVu52-35Y',
    appId: '1:263737104395:android:4fb2ab4e0c8a6c1ad94f0e',
    messagingSenderId: '263737104395',
    projectId: 'e-pingo',
    storageBucket: 'e-pingo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALAsb026l5zZ7BySPq9-HvaNxj7thGEXE',
    appId: '1:263737104395:ios:cff0ea5028863ca4d94f0e',
    messagingSenderId: '263737104395',
    projectId: 'e-pingo',
    storageBucket: 'e-pingo.appspot.com',
    iosBundleId: 'com.example.epingo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyALAsb026l5zZ7BySPq9-HvaNxj7thGEXE',
    appId: '1:263737104395:ios:cff0ea5028863ca4d94f0e',
    messagingSenderId: '263737104395',
    projectId: 'e-pingo',
    storageBucket: 'e-pingo.appspot.com',
    iosBundleId: 'com.example.epingo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCawCB5qaVbipIpZGvUJH3LBsDeV1QauFk',
    appId: '1:263737104395:web:b2fb9348498d98c0d94f0e',
    messagingSenderId: '263737104395',
    projectId: 'e-pingo',
    authDomain: 'e-pingo.firebaseapp.com',
    storageBucket: 'e-pingo.appspot.com',
  );

}