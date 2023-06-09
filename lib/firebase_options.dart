// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA3-ZkRuUcyZKEEW7Yt5sBcVcVrTt55rPw',
    appId: '1:945442882900:web:37fdc8ccf87a08eb8e34c1',
    messagingSenderId: '945442882900',
    projectId: 'coffeewithfarooq-9a91f',
    authDomain: 'coffeewithfarooq-9a91f.firebaseapp.com',
    storageBucket: 'coffeewithfarooq-9a91f.appspot.com',
    measurementId: 'G-KLXMVX307F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAz02VQGNc5md-Dji79WFbYgPzfBn0L3n8',
    appId: '1:945442882900:android:5f1473e13aeea4498e34c1',
    messagingSenderId: '945442882900',
    projectId: 'coffeewithfarooq-9a91f',
    storageBucket: 'coffeewithfarooq-9a91f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfCfc0l0K1l2ZHc7B5H3E-sMw0ndgaEUo',
    appId: '1:945442882900:ios:21c4fbd6b4dbca7c8e34c1',
    messagingSenderId: '945442882900',
    projectId: 'coffeewithfarooq-9a91f',
    storageBucket: 'coffeewithfarooq-9a91f.appspot.com',
    iosBundleId: 'com.example.fastfodd',
  );
}
