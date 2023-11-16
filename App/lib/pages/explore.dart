
import 'package:coolapp/model/car_model.dart';
import 'package:coolapp/pages/carDisplay.dart';
import 'package:coolapp/pages/race.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key, required this.selecting, required this.button, required this.currentCar}): super(key: key);

  final bool selecting;
  final int button;
  final CarModel currentCar;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  static List<CarModel> mainCarList = [
    CarModel("Porsche 911 Turbo S", "https://files.porsche.com/filestore/image/multimedia/none/911-tus-modelimage-sideshot/model/930894f1-6214-11ea-80c8-005056bbdc38/porsche-model.png", 2.6, 641, 800,["https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U0%25z8rMbjAuWghMVEe61O3er0geLWjzwHlQaKf2GLmB0SPQrIgQuMNYw3x4x7Jv5c0jQvpjs7oW1fGVb2rEUA6efcRHvc","https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U0%25z8rMbjUuWghMVEe61O3er0geLWjzwHlQaKf2GLmB0SPQrIgQuMNYw3x4x7Jv5c0jQvpjs7oW1fGVb2rEUA6efcRHvc","https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U5Yz8rMHIspMtwZaiJQP0iO5Mi1pHcTCkFKGXoq1S95r6FObMFswRuT02g2dEhev5HFhLHnd7pQXqZYoOaD8JiXvBChv"]),
    CarModel("Porsche 911 GT3 RS", "https://files.porsche.com/filestore/image/multimedia/none/992-gt3-rs-modelimage-sideshot/model/cfbb8ed3-1a15-11ed-80f5-005056bbdc38/porsche-model.png", 3.0, 641, 600,["https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U0%25z8rMbjAuWghMVEeZV0iO5Mm1pHcTCkpJDKf2GLZKr6FObM4vwRuT0kuix7Jv5c0jQvpjs7oWrfGVb2rEUA6efcRHvc","https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U0%25z8rMbjUuWghMVEeZV0iO5Mm1pHcTCkpJDKf2GLZKr6FObM4vwRuT0kuix7Jv5c0jQvpjs7oWrfGVb2rEUA6efcRHvc","https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U5Yz8rMHIspMtwZaiIZ5yPewSQLCvNzxLE%25GXoq1IGOJUPYwghTBsN5xsy2dEhev5HFhLHnd7pOXqZYoOaD8JiXvBChv"]),
    CarModel("Porsche 911 GT3", "https://files.porsche.com/filestore/image/multimedia/none/992-gt3-modelimage-sideshot/model/765dfc51-51bc-11eb-80d1-005056bbdc38/porsche-model.png", 3.2, 641, 465,["https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U0%25z8rMbjAuWghMVEeZV0iO5MgtAHcTCkqHGXoq1I9Wr6FObMP4wRuT0kuix7Jv5c0jQvpjs7oWreGVb2rEUA6efcRHvc","https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U0%25z8rMbjUuWghMVEeZV0iO5MgtAHcTCkqHGXoq1I9Wr6FObMP4wRuT0kuix7Jv5c0jQvpjs7oWreGVb2rEUA6efcRHvc","https://pictures.porsche.com/rtt/iris?COSY-EU-100-1711coMvsi60AAt5FwcmBEgA4qP8iBUDxPE3Cb9pNXABuN9dMGF4tl3U5Yz8rMHIspMtwZaiIZ5yPewM38CvNzxfCqA7fQbmpOJUPYw6gTBsN5xsy2dEhev5HFhLHnd7pOiqZYoOaD8JiXvBChv"]),
  ];
  
  List<CarModel> displayList = List.from(mainCarList);
  

  void updateList(String value){
    setState((){
      displayList = mainCarList.where((element) => element.car_name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBar(context,widget.selecting, widget.currentCar),
      backgroundColor: Colors.white,
      body: searchBox(widget.selecting, widget.button)
    );
  }

  Column searchBox(selecting, button) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 40, left: 30),
            child: const Text(
            "Search For A Car",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.00,
              fontWeight: FontWeight.bold,

            )
            ),
        ),
        
        Container(
          margin: const EdgeInsets.only(top: 15,left: 20,right: 20),
          decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff1D1617).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0 
              )
          ]
        ),
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
                borderSide: BorderSide.none
            ),
            hintText: 'eg: Porsche 911'
          ),
        ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(child: displayList.isEmpty 
          ?const Center(child: 
          Text(
            "No Result Found", 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 22.0, 
              fontWeight: FontWeight.bold
            ),
            )
          )
          :ListView.builder(
          itemCount: displayList.length,
          itemBuilder: (context,index)=> GestureDetector(
            onTap: (){
              if (selecting == false) {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
                Future.delayed(const Duration(milliseconds: 150), (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => CarDisplay(car: displayList[index])),
                  );
                });
              }else{
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                Future.delayed(const Duration(milliseconds: 150), (){
                   Navigator.pop(context, displayList[index]);
                });
              }
            },
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              
              title: Text(
                displayList[index].car_name!, 
                style: const TextStyle(
                  color: Colors.black,
                   fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                '0-60: ${displayList[index].car_acceleration!} BHP: ${displayList[index].car_bhp!} Torque: ${displayList[index].torque!}', 
                style: const TextStyle(
                  color: Colors.black),
                  ),
                leading: Image.network(displayList[index].car_image_url!),
            ),
          ),)
        )
      ],
    );
  }
}

AppBar appBar(context,selecting,currentCar) {
    return AppBar(
      title: const Text
      ('Explore',
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
              if (selecting == false) {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
                Future.delayed(const Duration(milliseconds: 150), (){
                Navigator.pop(
                  context,);
                });
              }else{
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                Future.delayed(const Duration(milliseconds: 150), (){
                   Navigator.pop(context, currentCar);
                });
              }
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
