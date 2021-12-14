// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/home_page/components/banner.dart';
import 'package:food_delivery/widgets/home_page/components/recomended.dart';

import 'components/category.dart';
import 'components/popular_now.dart';
import 'components/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyBanner(),
                Categories(),
                PopularNow(),
                Recommended(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
