import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 100,
          fit: BoxFit.fitWidth,
        )
      ],
    );
    // return CustomList(height: Responsive.screenHeight(context)-150, searchBy: (st){return [];}, onSelectedIndexUpdate: , getTile: getTile, list: list);
  }
}
