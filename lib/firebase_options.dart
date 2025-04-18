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
    apiKey: 'AIzaSyCzW4685APi-IJZl1uUHiOO9GJ8_E0MCu4',
    appId: '1:382672446287:web:1c90afe5305657558d9b3a',
    messagingSenderId: '382672446287',
    projectId: 'project-43135',
    authDomain: 'project-43135.firebaseapp.com',
    storageBucket: 'project-43135.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBg4ZLlSi3wNhdQdClv4YI6WGzrLrCKikE',
    appId: '1:130122799016:android:f9879264581bae589f2f9d',
    messagingSenderId: '130122799016',
    projectId: 'consysttest-2c0f7',
    storageBucket: 'consysttest-2c0f7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgrHdOIca3tyuagDAQgqKyLlS3mdFTSZQ',
    appId: '1:130122799016:ios:7ee3ecf23c43f3859f2f9d',
    messagingSenderId: '130122799016',
    projectId: 'consysttest-2c0f7',
    storageBucket: 'consysttest-2c0f7.firebasestorage.app',
    iosBundleId: 'com.consysttest.consystTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOKA_8dC122pwAJGnKP-1Ndlx3l4phbi0',
    appId: '1:382672446287:ios:12f5f16bba2783fe8d9b3a',
    messagingSenderId: '382672446287',
    projectId: 'project-43135',
    storageBucket: 'project-43135.firebasestorage.app',
    iosBundleId: 'com.flashcurrent.flashcurrent',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCzW4685APi-IJZl1uUHiOO9GJ8_E0MCu4',
    appId: '1:382672446287:web:9eb5bd33bb9278e88d9b3a',
    messagingSenderId: '382672446287',
    projectId: 'project-43135',
    authDomain: 'project-43135.firebaseapp.com',
    storageBucket: 'project-43135.firebasestorage.app',
  );
}