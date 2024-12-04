import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../model/carModel.dart';

Container photoCarouselTitle(CarModel car) {
    return Container(
          width: 400,
          height: 50,
          margin: const EdgeInsets.only(bottom: 5.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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
            "Photos of ${car.carName}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        );
  }

  Container photoCarousel(CarModel car) {
    return Container(
          width: 400,
          height: 250,
          margin: const EdgeInsets.only(top: 20.0),
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
                      child: Image.network(i)
                    );
                  },
                );
              }
            ).toList(),
          ),
        );
  }