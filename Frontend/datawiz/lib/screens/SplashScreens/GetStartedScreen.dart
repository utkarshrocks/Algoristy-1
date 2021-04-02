import 'package:datawiz/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {

  var kIcons = <Widget>[
    for(int i=0;i<Imagesname.length;i++)
    Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("Assets/Images/getStartedImages/${Imagesname[i]}.png",width: ScreenWidth - 100,),
            Text(respectiveTaglines[i],style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
              fontFamily: "SplashFont",
            ),),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: ScreenWidth,
            height: ScreenHeight,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: DefaultTabController(
              length: kIcons.length,
              child: Builder(
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TabPageSelector(),
                      Expanded(
                        child: TabBarView(
                            children: kIcons
                        ),
                      ),
                      ElevatedButton(
                        child: Text('SKIP'),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, HomePageRouteCode);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
