// ignore: unused_import
import 'package:fairshare/map.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/settingpage.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'feedback.dart';
import 'firebase_options.dart';

import 'package:fairshare/driver.dart';
import 'package:fairshare/otp.dart';
import 'package:fairshare/rider.dart';
import 'package:flutter/material.dart';
import 'package:fairshare/register.dart';
Future<void> main() async {
     WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
     );
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone':(context) =>  const MyApp(),
      'verify':(context) => const MyVerify(),
      'rider':(context) => const MainDrawer(),
      'setting':(context) => const SettingPage(),
      'driver':(context) => const DriverForm(),
      'feedback':(context)=> const feedback(),
      'rate':(context) => const Rate(),
      'map':(context) => const MapSample()
    },
  ));
}
