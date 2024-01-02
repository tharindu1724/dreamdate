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
    apiKey: 'AIzaSyAVguZQ7Q1etop6OssTY0GUMC7Zr8cyIwA',
    appId: '1:256752929393:web:98eec45157cff1bad269d0',
    messagingSenderId: '256752929393',
    projectId: 'datingapp3-a',
    authDomain: 'datingapp3-a.firebaseapp.com',
    storageBucket: 'datingapp3-a.appspot.com',
    measurementId: 'G-NJNVE5FZJX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBR_uunZacVQqY5R30TCykHmmHRV7HOeq0',
    appId: '1:256752929393:android:540fbf3aca214856d269d0',
    messagingSenderId: '256752929393',
    projectId: 'datingapp3-a',
    storageBucket: 'datingapp3-a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_0tlB8f4Nb71aRhV7trKFKJb295zty4k',
    appId: '1:256752929393:ios:c95082b884af3e9fd269d0',
    messagingSenderId: '256752929393',
    projectId: 'datingapp3-a',
    storageBucket: 'datingapp3-a.appspot.com',
    iosBundleId: 'com.mydatingapp',
  );
}
