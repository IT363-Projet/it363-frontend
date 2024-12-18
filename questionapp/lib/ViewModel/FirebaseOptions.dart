
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {return web;}
    switch (defaultTargetPlatform) {
      case TargetPlatform.android: return android;
      case TargetPlatform.iOS: return ios;
      case TargetPlatform.macOS: return macos;
      case TargetPlatform.windows: return windows;
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
    apiKey: 'AIzaSyCy780o2-mFuom2FF-j607rDD8uprGHxI0',
    appId: '1:934279740430:web:74f032b06806ed08b8905f',
    messagingSenderId: '934279740430',
    projectId: 'question-app-af16e',
    authDomain: 'question-app-af16e.firebaseapp.com',
    storageBucket: 'question-app-af16e.firebasestorage.app',
    measurementId: 'G-RWC023TD55',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKu-WAmmehWM5jFc_vf_f0WHhAXGLOyY4',
    appId: '1:934279740430:android:3c3b21ef49ad8c59b8905f',
    messagingSenderId: '934279740430',
    projectId: 'question-app-af16e',
    storageBucket: 'question-app-af16e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnz_ns0CoUP2QKUA9f-vcxZibWHPxS5Cs',
    appId: '1:934279740430:ios:ccff90876f53b220b8905f',
    messagingSenderId: '934279740430',
    projectId: 'question-app-af16e',
    storageBucket: 'question-app-af16e.firebasestorage.app',
    iosBundleId: 'com.example.questionapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnz_ns0CoUP2QKUA9f-vcxZibWHPxS5Cs',
    appId: '1:934279740430:ios:ccff90876f53b220b8905f',
    messagingSenderId: '934279740430',
    projectId: 'question-app-af16e',
    storageBucket: 'question-app-af16e.firebasestorage.app',
    iosBundleId: 'com.example.questionapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCy780o2-mFuom2FF-j607rDD8uprGHxI0',
    appId: '1:934279740430:web:10f4802152de7159b8905f',
    messagingSenderId: '934279740430',
    projectId: 'question-app-af16e',
    authDomain: 'question-app-af16e.firebaseapp.com',
    storageBucket: 'question-app-af16e.firebasestorage.app',
    measurementId: 'G-1F5CZZX13X',
  );

}