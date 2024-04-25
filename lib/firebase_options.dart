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
    apiKey: 'AIzaSyDa58bCsBSw-ip-d5j3QeMspnb0A188nqo',
    appId: '1:71735245925:web:ff4d2309ef862f246fda8c',
    messagingSenderId: '71735245925',
    projectId: 'masroufi-application-e3ed7',
    authDomain: 'masroufi-application-e3ed7.firebaseapp.com',
    databaseURL: 'https://masroufi-application-e3ed7-default-rtdb.firebaseio.com',
    storageBucket: 'masroufi-application-e3ed7.appspot.com',
    measurementId: 'G-BC64WQ4Y2J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXYQ9F6o650I1a1Iuwz3gm5N83qhJWbnE',
    appId: '1:71735245925:android:17fc8f4bfa310af56fda8c',
    messagingSenderId: '71735245925',
    projectId: 'masroufi-application-e3ed7',
    databaseURL: 'https://masroufi-application-e3ed7-default-rtdb.firebaseio.com',
    storageBucket: 'masroufi-application-e3ed7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBm6lYsKutus6JQ11PFILaQ38G3-7uFlIA',
    appId: '1:71735245925:ios:4c0ab99bb6b6521f6fda8c',
    messagingSenderId: '71735245925',
    projectId: 'masroufi-application-e3ed7',
    databaseURL: 'https://masroufi-application-e3ed7-default-rtdb.firebaseio.com',
    storageBucket: 'masroufi-application-e3ed7.appspot.com',
    iosBundleId: 'com.example.masroufi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBm6lYsKutus6JQ11PFILaQ38G3-7uFlIA',
    appId: '1:71735245925:ios:4c0ab99bb6b6521f6fda8c',
    messagingSenderId: '71735245925',
    projectId: 'masroufi-application-e3ed7',
    databaseURL: 'https://masroufi-application-e3ed7-default-rtdb.firebaseio.com',
    storageBucket: 'masroufi-application-e3ed7.appspot.com',
    iosBundleId: 'com.example.masroufi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDa58bCsBSw-ip-d5j3QeMspnb0A188nqo',
    appId: '1:71735245925:web:a09a65eaded8675e6fda8c',
    messagingSenderId: '71735245925',
    projectId: 'masroufi-application-e3ed7',
    authDomain: 'masroufi-application-e3ed7.firebaseapp.com',
    databaseURL: 'https://masroufi-application-e3ed7-default-rtdb.firebaseio.com',
    storageBucket: 'masroufi-application-e3ed7.appspot.com',
    measurementId: 'G-VCDCGSHNME',
  );
}