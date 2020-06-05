import 'package:cdioklient/Pages/CameraPage.dart';
import 'package:cdioklient/Pages/PreviewPage.dart';
import 'package:cdioklient/Pages/SolitairePage.dart';
import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      routes: {
        'home' : (context) => Home(),
        'Game Screen' : (context) => SolitairePage(),
        'Camera Screen' : (context) => CameraScreen(),
        'Preview Screen' : (context) => PreviewScreen()
      },
    );
  }
}
