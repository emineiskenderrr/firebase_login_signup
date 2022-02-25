import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_firebase/methods.dart';
import 'package:login_signup_firebase/screens/home_screen.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, //klavyeyi açtığımızda 'bottom overflowed by pixels flutter' gibi bir hatayla karşılaşmamak için
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSignupText(),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 50),
                child: TextFormField(
                  decoration: InputDecoration(
                    //  border: OutlineInputBorder(),
                    labelText: ("Your name"),
                    icon: Icon(
                      Icons.account_circle_rounded,
                      color: Colors.black,
                    ),
                  ),
                  controller: _name,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 50),
                child: TextFormField(
                  decoration: InputDecoration(
                    //  border: OutlineInputBorder(),
                    labelText: ("Email address"),
                    icon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                  ),
                  controller: _email,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 50),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                      labelText: ("Password"),
                      icon: Icon(
                        Icons.vpn_key,
                        color: Colors.black,
                      )),
                  controller: _password,
                ),
              ),
              SizedBox(height: 80),
              buildSignupButton(context, _name, _email , _password),
              SizedBox(height: 10),
              buildLoginText(context),
            ],
          ),
        ),
      ),
    );
  }
}

Padding buildSignupText() {
  return Padding(
    padding: EdgeInsets.only(left: 20, top: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Create an account ',
          style: TextStyle(
            //  fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black54,
          ),
        ),
      ],
    ),
  );
}

buildSignupButton(BuildContext context, TextEditingController name, TextEditingController email , TextEditingController password) {
  return Padding(
    padding: const EdgeInsets.only(left: 45.0),
    child: Container(
      padding: EdgeInsets.only(
        right: 105,
        left: 105,
      ),
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
          if (name.text.isNotEmpty &&
              email.text.isNotEmpty &&
              password.text.isNotEmpty) {

            createAccount(name.text, email.text, password.text).then((user) {
              if (user != null) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
                print("Account Create Sucessfull");
              } else {
                print("Account Create Failed");

              }
            });
          } else {
            print("Please enter Fields");
          }
        },
        style: ElevatedButton.styleFrom(primary: Colors.black),
      ),
    ),
  );
}

buildLoginText(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Already have an account? ",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      ),
      new GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
        child: new Text(
          "Log in",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      )
    ],
  );
}