import 'package:datawiz/screens/Covid/CompareCovid.dart';
import 'package:datawiz/screens/Covid/LoadCovidCases.dart';
import 'package:datawiz/screens/Main.dart';
import 'package:datawiz/screens/Veteran/LoadVeteranData.dart';
import 'package:datawiz/screens/aboutus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
      initialRoute: "/initialroute",
      routes: routes,
    );
  }
}

var routes = <String,WidgetBuilder>{
  "/initialroute": (BuildContext context) => Main(),
  "/loadcoviddata": (BuildContext context) => LoadCovidData(),
  "/loadveterandata": (BuildContext context) => LoadVeteranData(),
  "/comparecoviddata": (BuildContext context) => CompareCovid(),
  "/aboutus": (BuildContext context) => AboutUs(),
};