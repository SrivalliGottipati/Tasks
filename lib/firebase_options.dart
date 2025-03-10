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
    apiKey: 'AIzaSyBVGkGBjEEWPkKfR3S35yknRDspYjXE_5M',
    appId: '1:47307296958:web:9dfed94348e42d992d0eef',
    messagingSenderId: '47307296958',
    projectId: 'dr-fb-2b2e2',
    authDomain: 'dr-fb-2b2e2.firebaseapp.com',
    storageBucket: 'dr-fb-2b2e2.firebasestorage.app',
    measurementId: 'G-FE46ZJH520',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwdMhfdJB-SfN5VFci8E9tJXgJ-fnaQBs',
    appId: '1:47307296958:android:3f8b774c9db1707c2d0eef',
    messagingSenderId: '47307296958',
    projectId: 'dr-fb-2b2e2',
    storageBucket: 'dr-fb-2b2e2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqlo7DlJ2RuMyKd57radtv0rJejxf_VJI',
    appId: '1:47307296958:ios:6ee4051aaa8d65a32d0eef',
    messagingSenderId: '47307296958',
    projectId: 'dr-fb-2b2e2',
    storageBucket: 'dr-fb-2b2e2.firebasestorage.app',
    iosBundleId: 'com.example.tasksweek',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqlo7DlJ2RuMyKd57radtv0rJejxf_VJI',
    appId: '1:47307296958:ios:6ee4051aaa8d65a32d0eef',
    messagingSenderId: '47307296958',
    projectId: 'dr-fb-2b2e2',
    storageBucket: 'dr-fb-2b2e2.firebasestorage.app',
    iosBundleId: 'com.example.tasksweek',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBb4NCynyKFmr0_Xv8C03WL6OpQJ1UEoUE',
    appId: '1:47307296958:web:422e4b7841ef90ce2d0eef',
    messagingSenderId: '47307296958',
    projectId: 'dr-fb-2b2e2',
    authDomain: 'dr-fb-2b2e2.firebaseapp.com',
    storageBucket: 'dr-fb-2b2e2.firebasestorage.app',
    measurementId: 'G-V2CZ5679LM',
  );

}