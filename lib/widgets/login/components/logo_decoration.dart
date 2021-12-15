import 'package:flutter/material.dart';

class LogoDecoration extends StatelessWidget {
  const LogoDecoration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/shape_log.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Image.asset('assets/images/logo_need_food.png'),
    );
  }
}
