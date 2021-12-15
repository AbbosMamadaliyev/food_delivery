// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignInFields extends StatefulWidget {
  const SignInFields({Key? key}) : super(key: key);

  @override
  _SignInFieldsState createState() => _SignInFieldsState();
}

class _SignInFieldsState extends State<SignInFields> {
  bool tapLoginForm = false;
  bool tapPasswordForm = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            child: Image.asset('assets/images/back_in_login.png'),
            alignment: Alignment.centerRight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 48),
            child: Column(
              children: [
                _buildTextSignin(),
                const SizedBox(height: 36),
                _buildLoginField(),
                const SizedBox(height: 10),
                _buildPasswordField(),
                const SizedBox(height: 18),
                _buildTextForgotPassword(),
                const SizedBox(height: 18),
                _buildLoginButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildLoginButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.lightBlue.withOpacity(.8)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Text _buildTextForgotPassword() {
    return Text(
      'Forgot password ? ',
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }

  Text _buildTextSignin() {
    return const Text(
      'Sign in',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Container _buildLoginField() {
    return Container(
      decoration: _formContainerDecoration(tapLoginForm),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              tapLoginForm = true;
            });
          } else {
            setState(() {
              tapLoginForm = false;
            });
          }
        },
        child: TextFormField(
          style: const TextStyle(fontSize: 18),
          decoration: _inputDecoration('Enter your mail'),
        ),
      ),
    );
  }

  Container _buildPasswordField() {
    return Container(
      decoration: _formContainerDecoration(tapPasswordForm),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              tapPasswordForm = true;
            });
          } else {
            setState(() {
              tapPasswordForm = false;
            });
          }
        },
        child: TextFormField(
          style: const TextStyle(fontSize: 18),
          decoration: _inputDecoration('Enter your password'),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hinText) {
    return InputDecoration(
      hintText: hinText,
      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      focusColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.lightBlue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  BoxDecoration _formContainerDecoration(bool tapField) {
    return BoxDecoration(
      color: tapField ? Colors.white : const Color(0xffE4E4E4),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          color: tapField ? Colors.lightBlue : Colors.transparent,
        ),
      ],
    );
  }
}
