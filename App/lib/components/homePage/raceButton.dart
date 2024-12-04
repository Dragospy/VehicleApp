import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../model/carModel.dart';
import '../../pages/race.dart';
import '../reusable/button.dart';

  GestureDetector raceButton(BuildContext context) {

    List<CarModel> selectedCars = [
      CarModel("default", "dummy_car","0.0", "0", "0",["","",""]),
    ];

    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) =>  RacePage(carSent:false, car:selectedCars[0])),
        );
      },
      child: button(148,34, "Race"),
    );
  }