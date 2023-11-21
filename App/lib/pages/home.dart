import 'package:coolapp/pages/explore.dart';
import 'package:coolapp/pages/race.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:coolapp/model/car_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static List<CarModel> selectedCars = [
    CarModel("default", "dummy_car",0.0, 0, 0,["","",""]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor:Colors.white,
      body: Column(
        children: [
          sButtons(context)
        ],
      ),
      drawer: const Drawer(),
    );
  }

  Container sButtons(BuildContext context) {
    return Container(
          padding: const EdgeInsets.symmetric(vertical:150),
          child: Column(
        children: [
          Container(
            width: 333,
            height: 131,
            margin: const EdgeInsets.symmetric(vertical:20.0),
            child:Image.asset('assets/icons/Logo.png', fit:BoxFit.cover),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) =>  ExplorePage(selecting: false, button: 0,currentCar: selectedCars[0],)),
                  );
                },
                child: Container(
                  width: 148,
                  height: 34,
                  margin: const EdgeInsets.symmetric(vertical:10.0),
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
                    "Explore",
                  style : TextStyle(
                      color: Colors.black,
                      fontSize: 25,  
                    ),),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) =>  RacePage(carSent:false, car:selectedCars[0])),
                  );
                },
                child: Container(
                  width: 148,
                  height: 34,
                  margin: const EdgeInsets.symmetric(vertical:20.0),
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
          )
        ],
      )
        );
  }



  AppBar appBar(context) {
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
      leading: GestureDetector(
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
      ),
    );
  }
}