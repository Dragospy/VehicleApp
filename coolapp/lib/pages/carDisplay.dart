// ignore_for_file: non_constant_identifier_names, file_names

import 'package:coolapp/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarDisplay extends StatelessWidget {
  const CarDisplay({super.key, required this.car});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor:Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.network(car.car_image_url!),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 129,
                height: 37,
                margin: const EdgeInsets.symmetric(vertical:20.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                child: Text('0-60 MPH : ${car.car_acceleration}s'),
              ),
              Container(
                width: 129,
                height: 37,
                margin: const EdgeInsets.symmetric(vertical:20.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                child: Text('BHP : ${car.car_bhp}'),
              ),
              Container(
                width: 129,
                height: 37,
                margin: const EdgeInsets.symmetric(vertical:20.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                child: Text('Torque : ${car.torque} Nm',),
              ),
          ],),
             Container(
              width: 400,
              height: 250,
              margin: const EdgeInsets.only(top:20.0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
               child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.9,
                    height: 300.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: car.images!.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 1.0),
                          child:Image.network(i)
                        );
                      },
                    );
                  }).toList(),
                ),
             ),
    
             Container(
                width: 400,
                height: 50,
                margin: const EdgeInsets.only(bottom: 5.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.circular(10),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
                ),
            child: Text(
              "Photos of ${car.car_name}",
              style:const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),),),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                GestureDetector(
                onTap: (){
                },
                child: Container(
                  width: 185,
                  height: 40,
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
                    "Engine Sound",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),),
                ),
              ),
              GestureDetector(
                onTap: (){
                },
                child: Container(
                  width: 185,
                  height: 40,
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
                      fontSize: 20,
                    ),),
                ),
              ),
                ],
              )
           ],
      ),

    );
  } 
 
AppBar appBar(context) {
    return AppBar(
      title: Text
      (car.car_name!,
      style: const TextStyle(
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
}