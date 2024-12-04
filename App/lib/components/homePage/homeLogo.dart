import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Container homeLogo() {
    return Container(
          width: 333,
          height: 131,
          margin: const EdgeInsets.symmetric(vertical:20.0),
          child:Image.asset('assets/icons/Logo.png', fit:BoxFit.cover),
        );
  }
