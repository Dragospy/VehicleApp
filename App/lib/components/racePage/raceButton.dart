import '../../model/carModel.dart';
import 'package:flutter/material.dart';

Container raceButton(int vehIndex, List<CarModel> mainCarList) {
    vehIndex = vehIndex - 1;
    return Container(
        width: 350,
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: (() {
          if (mainCarList[vehIndex].carName != 'default') {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(mainCarList[vehIndex].carImageUrl!),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 20, top: 10),
                        child: Text(
                          '${mainCarList[vehIndex].carName}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                        '0-60: ${mainCarList[vehIndex].carAcceleration!} BHP: ${mainCarList[vehIndex].carBhp!} Torque: ${mainCarList[vehIndex].torque!}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            );
          } else {
            return const Text(
              "Select a vehicle",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            );
          }
        }()));
  }