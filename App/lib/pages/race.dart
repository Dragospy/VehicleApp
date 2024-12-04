import '../components/racePage/raceButton.dart';
import '../components/racePage/startRace.dart';
import '../model/carModel.dart';
import '../pages/explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import '../pages/raceResults.dart';

List<CarModel> mainCarList = [
  CarModel("default", "dummy_car", "0.0", "0", "0", ["", "", ""]),
  CarModel("default", "dummy_car", "0.0", "0", "0", ["", "", ""])
];

void resetCars() {
  mainCarList[0] =
      CarModel("default", "dummy_car", "0.0", "0", "0", ["", "", ""]);
  mainCarList[1] =
      CarModel("default", "dummy_car", "0.0", "0", "0", ["", "", ""]);
}

class RacePage extends StatefulWidget {
  const RacePage({super.key, required this.carSent, required this.car});

  final bool carSent;
  final CarModel car;

  @override
  State<RacePage> createState() => _RacePageState();
}

class _RacePageState extends State<RacePage> {
  Future<void> getCar(BuildContext context, button) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    if (button == 1) {
      mainCarList[0] = await Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ExplorePage(
                  selecting: true,
                  button: 1,
                  currentCar: mainCarList[0],
                )),
      );
      setState(() {});
    } else {
      mainCarList[1] = await Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ExplorePage(
                  selecting: true,
                  button: 2,
                  currentCar: mainCarList[1],
                )),
      );
      setState(() {});
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    if (widget.carSent == true) {
      mainCarList[0] = widget.car;
    }
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  getCar(context, 1);
                },
                child: raceButton(1, mainCarList),
              ),
              GestureDetector(
                onTap: () {
                  getCar(context, 2);
                },
                child: raceButton(2, mainCarList),
              ),
              GestureDetector(
                onTap: () {
                  if (mainCarList[0].carName != 'default' &&
                      mainCarList[1].carName != 'default') {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const RaceResults()),
                    );
                  }
                },
                child: startRace(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar appBar(context) {
  return AppBar(
    title: const Text(
      'Racing',
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
        resetCars();
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
  );
}
