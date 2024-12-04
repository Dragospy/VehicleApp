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
import '../db.dart';
import '../model/carModel.dart';
import 'carAdd.dart';

bool firstLoad = true;

class ExplorePage extends StatefulWidget {
  const ExplorePage(
      {super.key,
      required this.selecting,
      required this.button,
      required this.currentCar});

  final bool selecting;
  final int button;
  final CarModel currentCar;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //StreamSubscription<QuerySnapshot>? _carListSubscription;

  List<CarModel> mainCarList = [];

  List<CarModel> displayList = [];

  Future<void> addNewCar(BuildContext context) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => addCarPage()),
    );
    getCars();
  }

  void getCars() {
    if (mainCarList != DB.mainCarList) {
      mainCarList = DB.mainCarList;
      setState(() {
        displayList = mainCarList;
      });
    }
  }

 Future<void> getCarsOnRefresh() async{
    if (mainCarList != DB.mainCarList) {
      mainCarList = DB.mainCarList;
      setState(() {
        displayList = mainCarList;
      });
    }
  }

  void updateList(String value) {
    setState(() {
      displayList = mainCarList
          .where((element) =>
              element.carName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    getCars();
    return Scaffold(
      appBar: exploreBar(context, widget.selecting, widget.currentCar),
      backgroundColor: Colors.white,
      body: searchBox(widget.selecting, widget.button),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          addNewCar(context);
        },
        backgroundColor: Colors.red,
        child: Icon(color: Colors.white, Icons.add),
      ),
    );
  }

  Column searchBox(selecting, button) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchBarTitle(),
        searchBar(),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
            child: displayList.isEmpty
                ? noResults()
                : RefreshIndicator(
                    backgroundColor: Colors.red,
                    color: Colors.white,
                    onRefresh: () =>  getCarsOnRefresh(),
                    child: resultsFound(selecting, displayList)
                  )
                ),
      ],
    );
  }

  Container searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        onChanged: (value) => updateList(value),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            hintText: 'eg: Porsche 911'),
      ),
    );
  }
}
