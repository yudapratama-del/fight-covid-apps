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

  
}
