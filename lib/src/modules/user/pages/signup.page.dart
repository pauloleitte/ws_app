import 'package:flutter/material.dart';
import 'package:ws_app/src/core/app_constants.dart';
import 'package:ws_app/src/modules/user/widgets/body_signup.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: BodySignup());
  }
}
