// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/home_page/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> body = [
    HomePage(),
    Center(
      child: Text('content 2'),
    ),
    Center(
      child: Text('content3 '),
    ),
    Center(
      child: Text('content  4'),
    ),
    Center(
      child: Text('conten  5'),
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body[currentIndex],
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  BottomNavigationBar _buildBottomBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.indigoAccent,
      unselectedItemColor: Colors.black54,
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.shopping_cart),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_text),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: '',
        ),
      ],
    );
  }
}
