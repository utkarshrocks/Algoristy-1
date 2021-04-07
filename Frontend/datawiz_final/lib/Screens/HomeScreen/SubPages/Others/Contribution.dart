import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:confetti/confetti.dart';

class Contribution extends StatefulWidget {
  @override
  _ContributionState createState() => _ContributionState();
}

class _ContributionState extends State<Contribution> {

  ConfettiController controller;
  List<String> Names = ["Tushar Gupta", "Soham Mehta", "Utkarsh Gangwar", "Utkarsh Garg"];
  List<String> rollnumbers = ["IIT2019043","IIT2019033","IIT2019023","IIT2019026"];
  List<String> github = ["https://github.com/Tushargupta9800", "https://github.com/CrashTV1334", "https://github.com/utkarshrocks", "https://github.com/UtkarshGarg123"];
  List<String> whatsapp = [
    "https://wa.me/+91100?text=Hi, Tushar",
    "https://wa.me/+91100?text=Hi, Soham",
    "https://wa.me/+91100?text=Hi, Utkarsh",
    "https://wa.me/+91100?text=Hi, Utkarsh"
  ];
  List<String> gmail = [
    "mailto:iit2019043@iiita.ac.in?Subject=Hi, Tushar",
    "mailto:iit2019033@iiita.ac.in?Subject=Hi, Soham",
    "mailto:iit2019023@iiita.ac.in?Subject=Hi, Utkarsh",
    "mailto:iit2019026@iiita.ac.in?Subject=Hi, Utkarsh",
  ];
  List<String> Contributions = [
    "- Did major works on the mobile based application and prepared various variable models for the application.\n\n- Implemented some external models for the outliers section of the project.",
    "- Did major works on the web based implementation of the project and fabricated the models and theoretical implementation into the project.\n\n- Classified the major chunks from the dataset into more understandable data elements.",
    "- Worked on the design and interface of the android based application.\n\n- Making sure the functionalities of the project are working fine and debugging for errors.",
    "- Collecting some external resources or modules required for the project.\n\n- Worked on some interface elements for web based design of the model."
  ];

  @override
  void initState() {
    controller = ConfettiController(duration: const Duration(seconds: 10));
    controller.play();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenWidth,
        height: ScreenHeight,
        color: Colors.grey[900],
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: controller,
                blastDirectionality: BlastDirectionality
                    .explosive, // don't specify a direction, blast randomly
                shouldLoop:
                true, // start again as soon as the animation is finished
                colors:  [
                  Colors.green[900],
                  Colors.blue[900],
                  Colors.pink[900],
                  Colors.orange[900],
                  Colors.purple[900]
                ], // manually specify the colors to be used
                // createParticlePath: drawStar, // define a custom shape/path.
              ),
            ),
            Positioned(
              top: 0, left: 0,
                child: Container(
                  width: ScreenWidth,
                  height: 200,
                  padding: EdgeInsets.only(left: 20,top: 20),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    border: Border.all(color: Colors.white38),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                  ),
                  child: Text("Contributions",
                    style: TextStyle(
                        fontFamily: "SplashFont",
                        color: Colors.white,
                        fontSize: 25
                    ),),
                )
            ),
            Container(
              width: ScreenWidth,
              height: ScreenHeight,
              child: ListView.builder(
                itemCount: 4,
                physics: PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        width: ScreenWidth-100,
                        height: ScreenHeight-150,
                        decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                                child: Image.asset("Assets/Images/contributions/boy"+(index+1).toString()+".png",
                                  width: 150,height: 200,fit: BoxFit.fitHeight,),
                            ),
                            Container(
                              width: ScreenWidth-100,
                              height: ScreenHeight-150,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    Text(Names[index],
                                      style: TextStyle(
                                      fontFamily: "SplashFont",
                                        color: Colors.white,
                                        fontSize: 20
                                    ),),
                                    Text(rollnumbers[index],
                                      style: TextStyle(
                                          fontFamily: "SplashFont",
                                          color: Colors.white,
                                          fontSize: 30
                                      ),),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(Contributions[index],
                                      style: TextStyle(
                                          fontFamily: "SplashFont",
                                          color: Colors.white,
                                          fontSize: 15,
                                        shadows: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 1.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(1.5, 1.5), // shadow direction: bottom right
                                          )
                                        ],
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 30,bottom: 10),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await launch(gmail[index]);
                                      },
                                      child: Image.asset("Assets/Images/contact/email.png",width: 20,height: 20,),
                                    ),
                                    SizedBox(width: 10,),
                                    GestureDetector(
                                      onTap: () async {
                                        await launch(github[index]);
                                      },
                                      child: Image.asset("Assets/Images/contact/github.png",width: 25,height: 25,),
                                    ),
                                    SizedBox(width: 10,),
                                    GestureDetector(
                                      onTap: () async {
                                        await launch(whatsapp[index]);
                                      },
                                      child: Image.asset("Assets/Images/contact/whatsapp.png",width: 20,height: 20,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                }
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 10,bottom: 10),
                  child: Image.asset("Assets/Images/AppIcon/appicon.png",width: 35,height: 35,)
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(right: 10,bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("-Team Algoristy",
                      style: TextStyle(
                          fontFamily: "SplashFont",
                          color: Colors.grey,
                          fontSize: 15
                      ),),
                    Text("SOE",
                      style: TextStyle(
                          fontFamily: "SplashFont",
                          color: Colors.grey,
                          fontSize: 10
                      ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
