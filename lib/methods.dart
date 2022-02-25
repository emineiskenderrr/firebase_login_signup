import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_firebase/screens/login_page.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password))
        .user;
    if (user != null) {
      print("Account created Succesfull");
      // aşağı satırdakileri yazınca sadece firestore kuruyoruz bunu çalıştırıp
      //yeni account ekleyince firestore tablosu oluşuyor.
      await _firestore.collection('user').doc(_auth.currentUser!.uid).set({
        "name": name,
        "email": email,
        "password": password,
        "status": "Unavaliable",
      });
      return user;
    } else {
      print("Account creation failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password))
        .user;
    if (user != null) {
      print("LogIn Succesfull");
      return user;
    } else {
      print("LogIn failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const LoginPage()));
    });
  } catch (e) {
    print(e);
    return null;
  }
}