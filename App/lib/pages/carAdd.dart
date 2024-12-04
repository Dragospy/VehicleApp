import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/explorePage/exploreBar.dart';
import '../components/explorePage/noResults.dart';
import '../components/explorePage/resultsFound.dart';
import '../components/explorePage/searchBarTitle.dart';
import '../components/reusable/button.dart';
import '../db.dart';
import '../model/carModel.dart';

bool firstLoad = true;

class addCarPage extends StatefulWidget {
  const addCarPage({super.key});

  @override
  State<addCarPage> createState() => _addCarPageState();
}

class _addCarPageState extends State<addCarPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CarModel car = CarModel("", "", "", "", "", []);
  List<String> tempImageList = [];
  String imageValue = "";
  String errorMessage = "";

  displayError(String message) {
    setState(() {
      errorMessage = message;
    });
  }

  updateCar(String value, String field) {
    if (field == "carName") {
      car.carName = value;
    }

    if (field == "carImageUrl") {
      car.carImageUrl = value;
    }

    if (field == "carAcceleration") {
      car.carAcceleration = value;
    }

    if (field == "carBhp") {
      car.carBhp = value;
    }

    if (field == "torque") {
      car.torque = value;
    }

    setState(() {});
  }

  updateImages(String value, int index) {
    car.images!.add(value);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(context),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: SizedBox( height:1000, child: addCarBody())));
  }

  Column addCarBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              errorMessage,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        carDetailInput("the car name", "carName"),
        SizedBox(
          height: 25,
        ),
        carDetailInput("the car image url", "carImageUrl"),
        SizedBox(
          height: 25,
        ),
        carDetailInput("the car acceleration", "carAcceleration"),
        SizedBox(
          height: 25,
        ),
        carDetailInput("the car BHP", "carBhp"),
        SizedBox(
          height: 25,
        ),
        carDetailInput("the car torque", "torque"),
        SizedBox(
          height: 25,
        ),
        carImageInputAndDisplay(),
      ],
    );
  }

  IconButton addCarButton() {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        if (car.carName!.isEmpty ||
            car.carAcceleration!.isEmpty ||
            car.carBhp!.isEmpty ||
            car.carImageUrl!.isEmpty ||
            car.torque!.isEmpty ||
            car.images!.isEmpty) {
          displayError("Inputs missing!");
        } else {
          DB.addCarToDb(car);
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Future.delayed(const Duration(milliseconds: 150), () {
            Navigator.pop(
              context,
            );
          });
          displayError("");
        }
      },
    );
  }

  Expanded carImageInputAndDisplay() {
    return Expanded(
      child: Column(
        children: [
          Container(
            child: carImageInput("images of the car"),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: car.images!.isEmpty
                  ? Container(
                    margin: EdgeInsets.only(top: 80),
                    child: Text("No Images added yet"))
                  : ListView.builder(
                      itemCount: car.images!.length,
                      itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.all(2),
                            height: 175,
                            width: 200,
                            child: Image.network(car.images![index]),
                          ))),
        ],
      ),
    );
  }

  Container carImageInput(hintText) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        onChanged: (value) => imageValue = value,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            hintText: 'Please input $hintText',
            suffixIcon: GestureDetector(
              onTap: () => updateImages(imageValue, 0),
              child: Icon(Icons.add),
            )),
      ),
    );
  }

  Container carDetailInput(hintText, field) {
    return Container(
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color(0xff1D1617).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0)
        ]),
        child: TextField(
          onChanged: (value) => updateCar(value, field),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            hintText: 'Please input $hintText',
          ),
        ));
  }

  AppBar appBar(context) {
    return AppBar(
      title: const Text(
        'Add Car',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Future.delayed(const Duration(milliseconds: 150), () {
            Navigator.pop(
              context,
            );
          });
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
      actions: [
        addCarButton(),
      ],
    );
  }
}
