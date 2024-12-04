import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import '../../pages/carDisplay.dart';

ListView resultsFound(selecting, displayList) {
    return ListView.builder(
                  
                  itemCount: displayList.length,
                  itemBuilder: (context, index) => 
                  GestureDetector(
                    onTap: () {
                      if (selecting == false) {
                        SystemChannels.textInput
                            .invokeMethod('TextInput.hide');
                        Future.delayed(const Duration(milliseconds: 150), () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>CarDisplay(car: displayList[index])
                              ),
                          );
                        });
                      } else {
                        SystemChannels.textInput
                            .invokeMethod('TextInput.hide');
                        Future.delayed(const Duration(milliseconds: 150), () {
                          Navigator.pop(context, displayList[index]);
                        });
                      }
                    },
                    child: carTile(displayList, index),
                  ),
                );
  }

ListTile carTile(displayList, int index) {
  return ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(
                      displayList[index].carName!,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '0-60: ${displayList[index].carAcceleration!} BHP: ${displayList[index].carBhp!} Torque: ${displayList[index].torque!}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    leading: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(displayList[index].carImageUrl!)
                      ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
}