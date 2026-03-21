// File generated manually to match your new Firebase project
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macOS.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Windows.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAODezWpDp_i2FyIYfTfRsFOOs5l4dv410',
    appId: '1:796357275000:android:44c05e758cd1bf046bec8d',
    messagingSenderId: '796357275000',
    projectId: 'to-do-app-138da',
    storageBucket: 'to-do-app-138da.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJMCNsXmYSQpQFybqM45B-_Lt0gDP_9-c',
    appId: '1:796357275000:ios:55fe860b6831100d6bec8d',
    messagingSenderId: '796357275000',
    projectId: 'to-do-app-138da',
    storageBucket: 'to-do-app-138da.firebasestorage.app',
    iosBundleId: 'com.example.toDoApp',
  );

}