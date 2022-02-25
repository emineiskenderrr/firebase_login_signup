import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_firebase/screens/home_screen.dart';
import 'package:login_signup_firebase/screens/login_page.dart';
import 'package:login_signup_firebase/screens/signup_page.dart';
import 'package:login_signup_firebase/screens/welcome_page.dart';

void main() async {
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/signup' : (context) => SignupPage(),
        '/homescreen' : (context) => HomeScreen(),
      },
      home:WelcomePage(),
    );
  }
}