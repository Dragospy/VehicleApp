import 'package:flutter/material.dart';

Container searchBarTitle() {
    return Container(
        margin: const EdgeInsets.only(top: 40, left: 30),
        child: const Text("Search For A Car",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.00,
              fontWeight: FontWeight.bold,
            )),
      );
  }