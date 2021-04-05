import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  List<String> Aboutus = [
    "On The HomeScreen You'll find few options to explore.Swap the tiles to view remaining options.",
    "Touch the curve to get more info about the Covid 19 on a particular date",
    "Slide horizontally to see the drawer options",
    "Swap vertically to explore The Covid 19 stats in Various regions of India",
    "Click on the Graph to get the exact number",
    "Click on the Graph for a moment and then slide",
    "You'll find two drop down menu options at the top of the screen where you can select different states for comparision",
    "Double Click on the data to get the info for a particular facility",
    "From the page slider you can jump to any of the available pages",
    "Click on a Article to see full news",
    "You can choose different countries to get their live news",
    "If you follow a particular news channel then we had an option to select some of the famous news channels",
    "Worldometer Tab helps to update you from the world casual data and world covid data",
    "Click Contributions tab on the HomeScreen to know the contributions of our team members and to contact us",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: ScreenWidth,
          height: ScreenHeight,
          color: Colors.grey[900],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: ScreenWidth,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.green[900],
                          Colors.black,
                          Colors.black,
                          Colors.blue[900],
                        ]
                    ),
                  ),
                  child: Center(
                    child: Text("About The App",style: TextStyle(
                        fontFamily: "SplashFont",
                        color: Colors.white,
                        fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Text("Hi, This is Team Algoristy",style: TextStyle(
                      fontFamily: "SplashFont",
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Wrap(
                  children: [
                    for(int i=1;i<15;i++)
                    Container(
                      child: FlipCard(
                        direction: FlipDirection.HORIZONTAL, // default
                        front: Container(
                          child: Image.asset("Assets/Gifs/G" + i.toString() +".gif",width: ScreenWidth/2,height: ScreenHeight/2,),
                        ),
                        back: Container(
                          width: ScreenWidth/2,
                          height: ScreenHeight/2-20,
                          color: Colors.grey[800],
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Text(Aboutus[i-1],style: TextStyle(
                            fontFamily: "SplashFont",
                            color: Colors.white,
                            fontSize: 15
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}