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
    apiKey: 'AIzaSyC1R1wShY5RO1-oprIZ4jSGnZD-CO9Y6-U',
    appId: '1:487579371636:web:f44b739a0d92318c762921',
    messagingSenderId: '487579371636',
    projectId: 'ahango',
    authDomain: 'ahango.firebaseapp.com',
    storageBucket: 'ahango.appspot.com',
    measurementId: 'G-STX73QJ7NM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEdAo7iGzEDlbNTIoC45Rt6yOUeRCqnYI',
    appId: '1:487579371636:android:e615202e7cf6c944762921',
    messagingSenderId: '487579371636',
    projectId: 'ahango',
    storageBucket: 'ahango.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKb0WR_vszip3YUp2NmqgSBkcw0owVeSo',
    appId: '1:487579371636:ios:cbc92d70df8bb3b2762921',
    messagingSenderId: '487579371636',
    projectId: 'ahango',
    storageBucket: 'ahango.appspot.com',
    iosBundleId: 'app.raccoonswarm.ahangoapp',
  );
}
