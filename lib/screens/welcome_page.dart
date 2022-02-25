import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        //safearea ekranın boyutuna göre uygulamanın şekillenmesini sağlar.
        child: Center(
          child: Container(
            child: Column(
              children: [
                buildWelcomeTitle(),
                buildCoverImage(),
                buildLoginButton(context),
                SizedBox(height: 30),
                buildSignUpButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding buildWelcomeTitle() {
  return Padding(
    padding: EdgeInsets.only(left: 30, top: 50, right: 30),
    child: Text(
      'Welcome to Carpa Diem',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
        color: Colors.black,
      ),
    ),
  );
}

Padding buildCoverImage() {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Image(
      image: AssetImage('assets/images/carpediem.jpeg'),
      width: 350.0,
      height: 350.0,
    ),
  );
}

buildLoginButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(right: 105, left: 105, top: 5, bottom: 5),
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(80.0)),
    child: ElevatedButton(
      child: Text(
        'LOG IN',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      style: ElevatedButton.styleFrom(primary: Colors.black),
    ),
  );
}

buildSignUpButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(right: 100, left: 100, top: 5, bottom: 5),
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(80.0)),
    child: ElevatedButton(
      child: Text(
        'SIGN UP',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/signup');
        /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );*/
      },
      style: ElevatedButton.styleFrom(primary: Colors.black),
    ),
  );
}