import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAJgHAbUcyzo2do9HwPVx4N6sL23ATo1SU",
            authDomain: "musicsessions-221c9.firebaseapp.com",
            projectId: "musicsessions-221c9",
            storageBucket: "musicsessions-221c9.appspot.com",
            messagingSenderId: "291057168764",
            appId: "1:291057168764:web:633892b91a4918a56db4f9"));
  } else {
    await Firebase.initializeApp();
  }
}
