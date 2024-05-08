
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get developement_Platform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3acM0tHI277DvdysDWabQmG7hUDd4dxw',
    appId: '1:504377675757:android:b71c8b6357a679bc8221e4',
    messagingSenderId: '504377675757',
    projectId: 'my-portfolio-a2c8a',
    storageBucket: 'my-portfolio-a2c8a.appspot.com',
  );















}
