import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../model/carModel.dart';
import '../../pages/explore.dart';
import '../reusable/button.dart';



  GestureDetector exploreButton(BuildContext context) {

     List<CarModel> selectedCars = [
      CarModel("default", "dummy_car","0.0", "0", "0",["","",""]),
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) =>  ExplorePage(selecting: false, button: 0,currentCar: selectedCars[0],)),
        );
      },
      child: button(148,34, "Explore")
    );
  }