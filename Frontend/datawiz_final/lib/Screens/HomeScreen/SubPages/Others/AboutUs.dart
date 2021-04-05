import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  String endNote = "Hi, This is Team Algoristy consists of 4 members"
      "\n\t-Tushar Gupta"
      "\n\t-Soham Mehta"
      "\n\t-Utkarsh Gangwar"
      "\n\t-Utkarsh garg"
      "\n\nWe The Students Of Indian Institute of Information Technology, Allahabad have made this project as an Assignment of SOE course. In making we had learnt a lots of things like"
      "\n\t-Using the Apis"
      "\n\t-Team Working"
      "\n\t-Importance of Use case, Activity and other diagrams"
      "\n\t-Understanding flutter better"
      "\n\t-Responsiveness of the Application"
      "\n\t-UI/UX designs"
      "\n\t-Handling the big dataset"
      "\n\t-And other things"
      "\n\nWhile making this project we have also faced some difficulties like"
      "\n\t-Using http package for sending request"
      "\n\t-How to use Flutter framework for a big project like this"
      "\n\t-Low Internet Connectivity"
      "\n\t-Using Github for team working"
      "\n\t-Handling the big dataset"
      "\n\t-Making screens Responsive"
      "\n\t-And other things"
      "\n\nIn the end note we just want to thank our Professors and TAs for helping us out and making us believe that we can build our own big applications like this. Projects made by our other classmates also makes us curious and excited to open other doors and explore new things.";

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
                  child: Text("Tutorial",style: TextStyle(
                      fontFamily: "SplashFont",
                      color: Colors.white,
                      fontSize: 25,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Text("End Note",style: TextStyle(
                      fontFamily: "SplashFont",
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Text(endNote,style: TextStyle(
                      fontFamily: "SplashFont",
                      color: Colors.grey[400],
                      fontSize: 8,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Text("Thanks",style: TextStyle(
                        fontFamily: "SplashFont",
                        color: Colors.grey[400],
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}