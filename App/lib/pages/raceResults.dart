import '../pages/race.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RaceResults extends StatelessWidget {
  const RaceResults({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor:Colors.white,
      drawer: const Drawer(),
    );
  }
  
AppBar appBar(context) {
    return AppBar(
      title: const Text
      ('Results',
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
  }}