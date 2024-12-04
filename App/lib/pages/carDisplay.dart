// ignore_for_file: non_constant_identifier_names, file_names

import '../components/carDisplay/carDisplayBar.dart';
import '../components/carDisplay/carStatDisplay.dart';
import '../components/carDisplay/displayButton.dart';
import '../components/carDisplay/photoCarousel.dart';
import '../model/carModel.dart';
import '../pages/race.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class CarDisplay extends StatelessWidget {
  const CarDisplay({super.key, required this.car});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: carDisplayBar(context, car),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.network(car.carImageUrl!),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              carStatDisplay('0-60 MPH : ${car.carAcceleration}s'),
              carStatDisplay('BHP : ${car.carBhp}'),
              carStatDisplay('Torque : ${car.torque} Nm'),
            ],
          ),
          photoCarousel(car),
          photoCarouselTitle(car),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: displayButton("Engine Sound"),
              ),
              /*GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            RacePage(carSent: true, car: car)),
                  );
                },
                child: displayButton("Race"),
              ),*/
            ],
          )
        ],
      ),
    );
  }
}
