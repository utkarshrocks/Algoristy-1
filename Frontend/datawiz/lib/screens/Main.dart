import 'package:datawiz/api/GetCovidData.dart';
import 'package:datawiz/api/GetVeteranData.dart';
import 'package:datawiz/screens/loading.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  bool Loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("DataWiz"),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                          onPressed: (){
                            setState(() {
                              Loading = true;
                            });
                            GetCovidData().then((value){
                              setState(() {
                                Loading = false;
                              });
                              Navigator.pushNamed(context, "/loadcoviddata");
                            });
                          },
                          child: Text("Covid Data",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            Loading = true;
                          });
                          GetVeteranData().then((value){
                            setState(() {
                              Loading = false;
                            });
                            Navigator.pushNamed(context, "/loadveterandata");
                          });
                        },
                        child: Text("Veteran HealthCare Data",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    // Container(
                    //   color: Colors.blue,
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 50,
                    //   margin: EdgeInsets.symmetric(horizontal: 20),
                    //   child: TextButton(
                    //     onPressed: (){
                    //       setState(() {
                    //         Loading = true;
                    //       });
                    //     },
                    //     child: Text("About Us",style: TextStyle(color: Colors.white),),
                    //   ),
                    // ),
                  ],
                ),
                (Loading)?Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: loading(color: Colors.blue),
                  color: Colors.white,
                ):SizedBox(height: 0,),
              ],
            ),
          ),
    ));
  }
}
