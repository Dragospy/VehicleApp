import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../model/carModel.dart';
import '../../pages/race.dart';

Container button(double width, double height, String text) {
  return Container(
    width: width,
    height: height,
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
    child: Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
    ),
  );
}
