import 'package:coolapp/model/car_model.dart';
import 'package:coolapp/pages/explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

List<CarModel> mainCarList = [
  CarModel("default", "dummy_car",0.0, 0, 0,["","",""]),
  CarModel("default", "dummy_car",0.0, 0, 0,["","",""])
];

void resetCars() {
  mainCarList[0] = CarModel("default", "dummy_car",0.0, 0, 0,["","",""]);
  mainCarList[1] = CarModel("default", "dummy_car",0.0, 0, 0,["","",""]);
}


class RacePage extends StatefulWidget {
  const RacePage({Key? key, required this.carsent, required this.car, required this.button}): super(key: key);

  final bool carsent;
  final int button;
  final CarModel car;

  @override
  State<RacePage> createState() => _RacePageState();
}



class _RacePageState extends State<RacePage> {
  Future<void> getCar(BuildContext context, button) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    if (button == 1){
      mainCarList[0] = await Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) =>   ExplorePage(selecting: true, button: 1, currentCar: mainCarList[0],)),);
        setState(() {});
    } else {
      mainCarList[1] = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) =>  ExplorePage(selecting: true, button: 2, currentCar: mainCarList[1],)),);
      setState(() {});
    }
  }
  

  @override

  Widget build(BuildContext context,) {
    return  Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
                onTap: (){
                  getCar(context, 1);
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
                  child:((){
                    // ignore: unnecessary_null_comparison
                    if (mainCarList[0].car_name != 'default') {
                      return Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20,right: 20),
                            child: Image.network(mainCarList[0].car_image_url!) ,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10,right: 20,top: 10),
                                child:Text(
                                '${mainCarList[0].car_name}', 
                                  style: const TextStyle(
                                    color: Colors.black, 
                                    fontSize: 15.0, 
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ),
                              Text(
                                '0-60: ${mainCarList[0].car_acceleration!} BHP: ${mainCarList[0].car_bhp!} Torque: ${mainCarList[0].torque!}', 
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0, 
                                  fontWeight: FontWeight.bold
                                )
                                  ),
                            ],

                          )
                        ],

                      );
                    }else{
                      return const Text(
                      "Select a vehicle",
                    style:TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),);
                    }
                  }())
      
                ),
              ),
              GestureDetector(
                onTap: (){
                  getCar(context, 2);
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
                  child: ((){
                    // ignore: unnecessary_null_comparison
                    if (mainCarList[1].car_name != 'default') {
                      return Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20,right: 20),
                            child: Image.network(mainCarList[1].car_image_url!) ,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10,right: 20,top: 10),
                                child:Text(
                                '${mainCarList[1].car_name}', 
                                  style: const TextStyle(
                                    color: Colors.black, 
                                    fontSize: 15.0, 
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ),
                              Text(
                                '0-60: ${mainCarList[1].car_acceleration!} BHP: ${mainCarList[1].car_bhp!} Torque: ${mainCarList[1].torque!}', 
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0, 
                                  fontWeight: FontWeight.bold
                                )
                                  ),
                            ],

                          )
                        ],

                      );

                    }else{
                      return const Text(
                      "Select a vehicle",
                    style:TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),);
                    }
                  }())
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
          resetCars();
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