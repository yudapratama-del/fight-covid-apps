import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey();

  static String userEmail = '';
  static String userPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Image.asset(
              "assets/images/login_illustration.png",
              fit: BoxFit.fill,
            ),
          ),
          loginForm()
        ],
      ),
    );
  }

  Widget loginForm() => Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: 300,
        height: 360,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 7,
              blurRadius: 15,
              offset: Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kLightGreen.withOpacity(0.6), kDeepGreen.withOpacity(0.7)],
          ),
        ),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("Login", style: kHeading4.copyWith(color: kWhite))),
            TextField(
              onChanged: (value) => userEmail = value,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                filled: true,
                fillColor: kWhite,
                prefixIcon: Icon(Icons.email_rounded),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(40)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) => userPassword = value,
              decoration: InputDecoration(
                hintText: 'Enter Your Password',
                filled: true,
                fillColor: kWhite,
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(40)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                  primary: kWhite,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  side: BorderSide(color: kWhite, width: 2),
                ),
                child: Text("Login", style: kHeading6)),
            SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(primary: kWhite),
                child: Text("Register", style: kSubtitle))
          ],
        ),
      );
}
