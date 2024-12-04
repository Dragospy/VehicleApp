import 'package:flutter/material.dart';


Container startRace() {
    return Container(
                width: 200,
                height: 48,
                margin: const EdgeInsets.only(
                    top: 10.0, left: 50.0, right: 50.0, bottom: 100.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset:
                          const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: const Text(
                  "Race",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              );
  }