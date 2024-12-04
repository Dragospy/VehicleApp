import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vehidex/db.dart';
import 'package:vehidex/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  initialiseFBApp();
}

void initialiseFBApp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DB.startCarStream();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Popins',
            //colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            //hoverColor: Colors.red,
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
