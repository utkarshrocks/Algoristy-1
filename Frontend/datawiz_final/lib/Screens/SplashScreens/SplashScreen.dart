import 'dart:async';

import 'package:datawiz_final/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:datawiz_final/SettingsAndVariables/SharedPreferences/SharedPreferences.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 5), (){
      getIntFromSharedPref().then((value) {
        Navigator.of(context).pop(true);
        if(value == 0) incrementStartup().then((value) => Navigator.pushNamed(context, GetstartedRouteCode));
        else Navigator.pushNamed(context, HomePageRouteCode);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: ScreenWidth,
            height: ScreenHeight,
            color: Colors.white70,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => resetCounter(),
                    child: Image.asset("Assets/Images/Background/main.gif",)
                ),
                SizedBox(height: 10,),
                Text("DataWiz",style: TextStyle(
                  fontSize: 35,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SplashFont",
                ),),

                Row(
                  children: [
                    Text("All The Data in ",style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SplashFont",
                    ),),
                    Text("Several ",style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SplashFont",
                      decoration: TextDecoration.lineThrough
                    ),),
                    Text("one Place",style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SplashFont",
                    ),),
                  ],
                ),

              ],
            ),
          ),
        )
    );
  }
}