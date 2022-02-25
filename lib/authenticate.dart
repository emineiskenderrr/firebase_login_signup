import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_firebase/screens/home_screen.dart';
import 'package:login_signup_firebase/screens/login_page.dart';


class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return const HomeScreen();
    } else {
      return const LoginPage();
    }
  }
}