import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static String userName = '';
  static String userEmail = '';
  static String userAddress = '';
  static String userPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 45),
            child: Image.asset(
              "assets/images/registration_illustration.png",
              fit: BoxFit.fill,
            ),
          ),
          registerForm()
        ],
      ),
    );
  }
}
