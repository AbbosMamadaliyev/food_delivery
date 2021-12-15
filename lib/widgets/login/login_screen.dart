// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/login/components/signin_fields.dart';

import 'components/logo_decoration.dart';
import 'components/signup_navigator_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoDecoration(),
            const SizedBox(height: 30),
            SignInFields(),
            SignupNavigatorButton()
          ],
        ),
      ),
    );
  }
}
