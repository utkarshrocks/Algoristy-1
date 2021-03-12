import 'package:datawiz/screens/LoadCovidCases.dart';
import 'package:datawiz/screens/LoadVeteranData.dart';
import 'package:datawiz/screens/Main.dart';
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
      home: Main(),
      routes: routes,
    );
  }
}

var routes = <String,WidgetBuilder>{
  "/loadcoviddata": (BuildContext context) => LoadCovidData(),
  "/loadveterandata": (BuildContext context) => LoadVeteranData()
};