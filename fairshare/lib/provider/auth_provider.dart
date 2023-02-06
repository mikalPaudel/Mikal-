import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';

import '../firebase_options.dart';

// If you need to use FirebaseAuth directly, make sure to hide PhoneAuthProvider:
// import 'package:firebase_auth/firebase_auth.dart' hide PhoneAuthProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseUIAuth.configureProviders([
    PhoneAuthProvider(),
    // ... other providers
  ]);
}
