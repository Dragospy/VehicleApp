import 'package:coolapp/model/car_model.dart';
import 'package:coolapp/pages/explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class Race extends StatelessWidget {
  const Race({super.key, required this.chosen});

  final CarModel chosen;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => const ExplorePage()),
                  );
                },
                child: Container(
                  width: 350,
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical:10.0, horizontal: 30.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(color: Colors.black) ,
                    borderRadius:BorderRadius.circular(100),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  ),
                  child: const Text(
                    "Select a vehicle",
                    style:TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),),
                ),
              ),
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  width: 350,
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical:10.0, horizontal: 30.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(color: Colors.black) ,
                    borderRadius:BorderRadius.circular(100),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  ),
                  child: const Text(
                    "Select a vehicle",
                    style:TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),),
                ),
              ),
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  width: 200,
                  height: 48,
                  margin: const EdgeInsets.only(top:10.0, left: 50.0,right: 50.0, bottom: 100.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(color: Colors.black) ,
                    borderRadius:BorderRadius.circular(100),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  ),
                  child: const Text(
                    "Race",
                    style:TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),),
                ),
              ),
              ],
      ),
    );
  }
}

AppBar appBar(context) {
    return AppBar(
      title: const Text
      ('Racing',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width:20,
            ),
        ),
      ),
    );
  }