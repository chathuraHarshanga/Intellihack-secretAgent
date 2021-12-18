import 'package:flutter/material.dart';
import 'package:heart_rp/screens/home_screen.dart';
import 'package:heart_rp/screens/login_screen.dart';
import 'package:heart_rp/screens/welcome_screen.dart';
import 'package:heart_rp/utils/const.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:starflut/starflut.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: Constants.lighTheme(context),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(title: '',),

    );
  }
}
