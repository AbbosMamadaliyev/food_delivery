import 'package:flutter/material.dart';

class ForgotPassTextButton extends StatefulWidget {
  const ForgotPassTextButton({Key? key}) : super(key: key);

  @override
  _ForgotPassTextButtonState createState() => _ForgotPassTextButtonState();
}

class _ForgotPassTextButtonState extends State<ForgotPassTextButton> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Text(
        'Forgot password ? ',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }
}
