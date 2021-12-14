// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Recommended extends StatefulWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recommended',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryCard('assets/images/b1.jpg'),
                _buildCategoryCard('assets/images/p6.jpg'),
                _buildCategoryCard('assets/images/p7.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCategoryCard(image) {
    return Container(
      height: 160,
      width: 230,
      margin: EdgeInsets.only(left: 22, top: 20, bottom: 20, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        /*   boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 12,
          ),
        ],*/
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Image.asset(
      //       image,
      //       fit: BoxFit.cover,
      //     ),
      //   ],
      // ),
    );
  }
}
