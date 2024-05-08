
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  /// Developement mode
  static FirebaseOptions get developement_Platform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return dev_android;
      // case TargetPlatform.iOS:
      //   return dev_ios;
    // case TargetPlatform.macOS:
    //   return macos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions dev_android = FirebaseOptions(
    apiKey: 'AIzaSyCX4ut6XUyJewFRSBmpFRErrkKGJGRPaiY',
    appId: '1:756208192158:android:cce4c779a937fbbea7498f',
    messagingSenderId: '756208192158',
    projectId: 'com.ksmyneber.dev',
    storageBucket: 'my-neber-development.appspot.com',
  );















}
