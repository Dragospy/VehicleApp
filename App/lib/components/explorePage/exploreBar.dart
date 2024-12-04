import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';


AppBar exploreBar(context, selecting, currentCar) {
  return AppBar(
    title: const Text(
      'Explore',
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        if (selecting == false) {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Future.delayed(const Duration(milliseconds: 150), () {
            Navigator.pop(
              context,
            );
          });
        } else {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Future.delayed(const Duration(milliseconds: 150), () {
            Navigator.pop(context, currentCar);
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/icons/Arrow - Left 2.svg',
          height: 20,
          width: 20,
        ),
      ),
    ),
  );
}
