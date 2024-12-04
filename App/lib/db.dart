import 'model/carModel.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class DB {
  static List<CarModel> mainCarList = [];
  static StreamSubscription<QuerySnapshot>? _carListSubscription;

  static void startCarStream() {
    _carListSubscription = FirebaseFirestore.instance
        .collection('cars')
        .snapshots()
        .listen((snapshot) {
      mainCarList = [];
      for (final document in snapshot.docs) {
        mainCarList.add(
          CarModel(
              document.data()['carName'] as String,
              document.data()['carImageUrl'] as String,
              document.data()['carAcceleration'] as String,
              document.data()['carBhp'] as String,
              document.data()['torque'] as String,
              document.data()['images'] as List),
        );
      }
    });
  }

  static void addCarToDb(CarModel car) {
    FirebaseFirestore.instance
        .collection('cars')
        .doc('${mainCarList.length}')
        .set({
      "carName": car.carName,
      "carImageUrl": car.carImageUrl,
      "carAcceleration": car.carAcceleration,
      "carBhp": car.carBhp,
      "torque": car.torque,
      "images": car.images
    });

    mainCarList.add(car);
  }
}
