import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

  AppBar homeBar(context) {
    return AppBar(
      title: const Text
      ('Car Explorer',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      
      centerTitle: true,
      /*leading: GestureDetector(
        onTap: (){
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Menu.svg',
            height: 20,
            width:20,
            ),
        ),
      ),*/
    );
  }