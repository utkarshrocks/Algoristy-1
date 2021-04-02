import 'package:datawiz/Screens/SplashScreens/SplashScreen.dart';
import 'package:datawiz/SettingsAndVariables/Routes/routes.dart';
import 'package:flutter/material.dart';

void main() {runApp(MyApp());}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes,
    );
  }
}