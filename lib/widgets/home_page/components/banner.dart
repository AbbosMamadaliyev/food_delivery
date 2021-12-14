import 'package:flutter/material.dart';

class MyBanner extends StatefulWidget {
  const MyBanner({Key? key}) : super(key: key);

  @override
  _MyBannerState createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 158,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/banner1.png',
            ),
          ],
        ),
      ),
    );
  }
}
