import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black54,
          body: Container(
            width: ScreenWidth,
            height: ScreenHeight,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: ScreenWidth,
                    height: ScreenHeight/2-10,
                    child: Stack(
                      children: [
                        Container(
                          width: ScreenWidth,
                          height: ScreenHeight/2-80,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[900],
                            image: DecorationImage(image: AssetImage("Assets/Images/Background/backgroundHomepage.jpg"),fit: BoxFit.fill),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          ),
                        ),
                        Positioned(
                            left: 10,
                            top: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("DataWiz",style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontFamily: "SplashFont",
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.grey[800],
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2, 2), // shadow direction: bottom right
                                    )
                                  ],
                                ),),
                                Text("Algoristy",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: "SplashFont",
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.grey[800],
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2, 2), // shadow direction: bottom right
                                    )
                                  ],
                                ),),
                              ],
                            )
                        ),
                        Positioned(
                          bottom: 0,
                            child: Container(
                              width: ScreenWidth,
                              height: 150,
                              child: ListView.builder(
                                itemCount: ImagesnameHomepage.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => Navigator.pushNamed(context, RoutenamesHomepage[index]),
                                    child: Container(
                                      width: 120,
                                      height: 130,
                                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [Colors.green[900], Colors.blue[900]]
                                          ),
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[800],
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(5, 5), // shadow direction: bottom right
                                          )
                                        ],
                                      ),
                                      child: Image.asset("Assets/Images/getStartedImages/${ImagesnameHomepage[index]}.png",)
                                    ),
                                  );
                                },
                              )
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("About The Project",style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[200],
                    decoration: TextDecoration.underline,
                  ),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    margin: EdgeInsets.only(right: 5),
                    width: ScreenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Assets/Images/AppIcon/appicon.png"),
                          scale: 10,
                          alignment: Alignment.bottomRight,
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("DataWiz is basically an android application, "
                            "which uses the datasets(Veteran health administration behaviour "
                            "health dataset and COVID-19 dataset) to interpret the trends in"
                            " the data and compare the data across the facilities and also enabling "
                            "us to find the outliers in the data",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
