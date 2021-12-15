import 'package:flutter/material.dart';

class SignupNavigatorButton extends StatelessWidget {
  const SignupNavigatorButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'No account yet ?',
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Sign up now ',
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.lightBlue,
              )
            ],
          ),
        ],
      ),
    );
  }
}
