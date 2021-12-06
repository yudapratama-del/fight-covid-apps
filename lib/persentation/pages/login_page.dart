import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/domain/entities/user.dart';
import 'package:capstone_apps/persentation/pages/main_page.dart';
import 'package:capstone_apps/persentation/pages/register_page.dart';
import 'package:capstone_apps/persentation/providers/auth_notifer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  // static final GlobalKey<FormState> _formKey = GlobalKey();

  static const ROUTE_NAME = "/login-page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userEmailCtrl = TextEditingController();

  final TextEditingController userPasswordCtrl = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 60,
            ),
            child: Image.asset(
              "assets/images/login_illustration.png",
              height: 150,
            ),
          ),
          loginForm(context)
        ],
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 35,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: 300,
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
          colors: [
            kLightGreen.withOpacity(0.6),
            kDeepGreen.withOpacity(0.7),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Login",
              style: kHeading4.copyWith(color: kWhite),
            ),
          ),
          TextField(
            onChanged: (value) => userEmailCtrl.text = value,
            decoration: InputDecoration(
              hintText: 'Enter Your Email',
              filled: true,
              fillColor: kWhite,
              prefixIcon: Icon(Icons.email_rounded),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            onChanged: (value) => userPasswordCtrl.text = value,
            decoration: InputDecoration(
              hintText: 'Enter Your Password',
              filled: true,
              fillColor: kWhite,
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Consumer<AuthNotifer>(
            builder: (context, state, _) {
              if (state.userSignInState == RequestState.Loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state.userSignInState == RequestState.Error) {
                return Text(
                  state.msg!,
                  style: kBodyText.copyWith(color: kRed),
                  textAlign: TextAlign.center,
                );
              } else {
                return SizedBox();
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          _isLoading
              ? SizedBox()
              : OutlinedButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    var isSignIn = await Provider.of<AuthNotifer>(context,
                            listen: false)
                        .logInUsers(userEmailCtrl.text, userPasswordCtrl.text);

                    if (isSignIn) {
                      Navigator.pushReplacementNamed(
                          context, MainPage.ROUTE_NAME);
                      setState(() {
                        _isLoading = false;
                      });
                    }

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 60,
                    ),
                    primary: kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: kWhite,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: kHeading6,
                  ),
                ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RegisterPage.ROUTE_NAME);
            },
            style: TextButton.styleFrom(
              primary: kWhite,
            ),
            child: Text(
              "Register",
              style: kSubtitle,
            ),
          )
        ],
      ),
    );
  }
}
