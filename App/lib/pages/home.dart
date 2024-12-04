import 'package:flutter/material.dart';
import '../components/homePage/exploreButton.dart';
import '../components/homePage/homeBar.dart';
import '../components/homePage/homeLogo.dart';
import '../components/homePage/raceButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeBar(context),
      backgroundColor: Colors.white,
      body: Column(
        children: [buttons(context)],
      ),
    );
  }

  Container buttons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: Column(
        children: [
          homeLogo(),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              exploreButton(context),
              //raceButton(context),
            ],
          )
        ],
      )
    );
  }
}
