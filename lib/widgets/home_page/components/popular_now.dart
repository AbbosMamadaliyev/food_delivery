// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PopularNow extends StatefulWidget {
  const PopularNow({Key? key}) : super(key: key);

  @override
  _PopularNowState createState() => _PopularNowState();
}

class _PopularNowState extends State<PopularNow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Now',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryCard('assets/images/burger_pop.png', 'Burger',
                    'Mcdi', 'Rp. 20.000'),
                _buildCategoryCard('assets/images/pizza_pop.png', 'Pizza',
                    'Mcdi', 'Rp. 40.000'),
                _buildCategoryCard('assets/images/pizza_pop.png', 'Pizza',
                    'Mcdi', 'Rp. 25.000'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCategoryCard(image, String ctg, String txt, String cost) {
    return Container(
      height: 190,
      width: 150,
      margin: EdgeInsets.only(left: 22, top: 20, bottom: 20, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          Text(
            ctg,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Text(
            txt,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            cost,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
