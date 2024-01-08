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
        return macos;
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
    apiKey: 'AIzaSyBNjnqdqdO_dtY90RHZu6tHqqFiXIUjpxc',
    appId: '1:834785665034:web:5dba43095c16eb45a9fff3',
    messagingSenderId: '834785665034',
    projectId: 'flutter-airline-main-project',
    authDomain: 'flutter-airline-main-project.firebaseapp.com',
    storageBucket: 'flutter-airline-main-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAcbQLh8BWAbu04SlfHGHwI4xXblClbOI',
    appId: '1:834785665034:android:cacf8e0bfa3efdf8a9fff3',
    messagingSenderId: '834785665034',
    projectId: 'flutter-airline-main-project',
    storageBucket: 'flutter-airline-main-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQWGHnqa_z6FXgKzFl16VeNil5gthw728',
    appId: '1:834785665034:ios:307914c6e396b346a9fff3',
    messagingSenderId: '834785665034',
    projectId: 'flutter-airline-main-project',
    storageBucket: 'flutter-airline-main-project.appspot.com',
    iosBundleId: 'com.example.aeroplane',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQWGHnqa_z6FXgKzFl16VeNil5gthw728',
    appId: '1:834785665034:ios:28a92756beda0fb7a9fff3',
    messagingSenderId: '834785665034',
    projectId: 'flutter-airline-main-project',
    storageBucket: 'flutter-airline-main-project.appspot.com',
    iosBundleId: 'com.example.aeroplane.RunnerTests',
  );
}
