// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/main_screen/main_screen.dart';
import 'package:food_delivery/widgets/splash_screen/body/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Widget> splashBodies = [
    SplashBody(
      image: 'assets/images/splash1.png',
      text1: 'Pilih menu \nfavoritemu',
      text2: 'Ada banyak jenis makanan yang tersedia disini',
    ),
    SplashBody(
      image: 'assets/images/splash2.png',
      text1: 'Temukan \nharga terbaik',
      text2: 'Ada banyak pilihan menu makanan disini ',
    ),
    SplashBody(
      image: 'assets/images/splash3.png',
      text1: 'Makananmu \nsiap diantarkan ',
      text2: 'Kami akan segera mengirim makanan anda hangat -   hangat',
    ),
  ];

  int currentIndex = 0;
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('assets/images/logo_image.png'),
              SizedBox(width: 8),
              Image.asset('assets/images/logo_text.png'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: splashBodies.length,
                itemBuilder: (BuildContext context, int index) {
                  return splashBodies[index];
                },
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              ),
            ),
            _buildDotController(),
          ],
        ),
      ),
    );
  }

  Container _buildDotController() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children:
                List.generate(splashBodies.length, (index) => _buildDot(index)),
          ),
          currentIndex == 2
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueAccent,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Container _buildDot(int index) {
    return Container(
      height: 12,
      width: currentIndex == index ? 48 : 12,
      margin: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffFFD7D4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: currentIndex == index ? 36 : 12,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:
                  currentIndex == index ? Color(0xffFF8982) : Color(0xffFFD7D4),
            ),
          ),
        ],
      ),
    );
  }
}
