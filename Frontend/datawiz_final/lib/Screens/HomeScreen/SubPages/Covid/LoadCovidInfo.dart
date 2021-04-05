import 'dart:ui';
import 'package:datawiz_final/Api/Covid/getCovidData.dart';
import 'package:datawiz_final/Models/CovidModels/PerDayCovidCasesModel.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Covid/ChooseStates.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:datawiz_final/SettingsAndVariables/Util/Fontstyles.dart';
import 'package:datawiz_final/SettingsAndVariables/Routes/RouteCodes.dart';

class LoadCovidInfo extends StatefulWidget {
  @override
  _LoadCovidInfoState createState() => _LoadCovidInfoState();
}

class _LoadCovidInfoState extends State<LoadCovidInfo> {

  bool Loading = true;
  bool ShowMenu = false;
  double Menuwidth = 60;
  bool ShowStates = false;

  @override
  void initState() {
    GetCovidData().then((value) {
      if(this.mounted)
      setState(() {
        Loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (Loading)?
      Container(
        width: ScreenWidth,
          height: ScreenHeight,
          color: Colors.black,
          child: Center(
              child: CircularProgressIndicator(),
          ),
      )
          :Scaffold(
        body: Container(
          width: ScreenWidth,
          height: ScreenHeight,
          color: Colors.black87,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: ScreenWidth,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue[900],
                        Colors.black,
                        Colors.black,
                        Colors.blue[900],
                      ]
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Covid Data",style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SplashFont",
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              GestureDetector(
                onHorizontalDragEnd: (val){
                  setState(() {
                    if(val.velocity  != Velocity.zero)
                    ShowMenu = !ShowMenu;
                  });
                },
                child: Container(
                  width: ScreenWidth,
                  height: MediaQuery.of(context).size.height - 75,
                  color: Colors.grey[900],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: (ShowMenu)?Menuwidth:0,
                        height: ScreenHeight - 75,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(2, 0),
                              )
                            ],
                            color: Colors.grey[850],
                          ),
                          child: AnimatedOpacity(
                            opacity: (ShowMenu)?1:0,
                            duration: Duration(milliseconds: 500),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      print("ehre");
                                      ShowMenu = !ShowMenu;
                                      selectedState = 0;
                                    });
                                  },
                                  child: Container(
                                    height: 100,
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("I",style: FontStyle3(Colors.white),),
                                          Text("ndia",style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    print("here");
                                    Navigator.of(context).pop();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ChooseStates()));
                                  },
                                  child: Container(
                                    height: 100,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("S",style: FontStyle3(Colors.white),),
                                              Text("elect",style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("S",style: FontStyle3(Colors.white),),
                                              Text("tate",style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      ShowMenu = !ShowMenu;
                                      print("outliers");
                                    });
                                    Navigator.pushNamed(context, CovidOutliersRouteCode);
                                  },
                                  child: Container(
                                    height: 100,
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("O",style: FontStyle3(Colors.white),),
                                          Text("utliers",style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      ShowMenu = !ShowMenu;
                                      print("compare");
                                      Navigator.pushNamed(context, CovidCompareRouteCode);
                                    });
                                  },
                                  child: Container(
                                    height: 100,
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("C",style: FontStyle3(Colors.white),),
                                          Text("ompare",style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        height: ScreenHeight - 75,
                        width: (ShowMenu)?ScreenWidth - Menuwidth:ScreenWidth,
                        duration: Duration(milliseconds: 500),
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(child: Text("INDIA",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.white),)),
                                    if(selectedState != 0) Center(child: Text(StatesCovidDataList[selectedState].State,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)),
                                    SizedBox(height: 10,),
                                    for(int i=0;i<IndiaShowDataNames.length;i++)
                                    Row(
                                      children: [
                                        Text(IndiaShowDataNames[i],style: FontStyle(),),
                                        Text(GetSelectedStateData()[i],style: FontStyle3(IndiaShowDataColor[i]),),
                                      ],
                                    ),
                                    (selectedState == 0)?Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 40,),
                                        Text("Total Confirmed",style: FontStyle3(Colors.red)),
                                        _getDashedLineChart("TC"),

                                        SizedBox(height: 40,),
                                        Text("Total Recovered",style: FontStyle2()),
                                        _getDashedLineChart("TR"),

                                        SizedBox(height: 40,),
                                        Text("Total Deaths",style: FontStyle3(Colors.red)),
                                        _getDashedLineChart("TD"),

                                        SizedBox(height: 40,),
                                        Text("Daily Confirmed",style: FontStyle3(Colors.red),),
                                        _getDashedLineChart("DC"),

                                        SizedBox(height: 40,),
                                        Text("Daily Recovered",style: FontStyle2()),
                                        _getDashedLineChart("DR"),

                                        SizedBox(height: 40,),
                                        Text("Daily Deaths",style: FontStyle3(Colors.red)),
                                        _getDashedLineChart("DD"),
                                      ],
                                    ):Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 25,),
                                        Center(
                                          child: Container(
                                            width: ScreenWidth - 100,
                                            height: 400,
                                            child: TotalCovidGraph(),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Center(
                                          child: Container(
                                            width: ScreenWidth - 100,
                                            height: 400,
                                            child: DailyCovidGraph()
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TotalCovidGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderColor: Colors.white,
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Total Covid Cases',textStyle: TextStyle(
        color: Colors.white,
      )),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
          labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            fontSize: 8,
          )
      ),
      primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),
          labelFormat: '{value}',
          labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500
          ),
          majorTickLines: MajorTickLines(size: 0)),
      series: <ColumnSeries<Data, String>>[
        ColumnSeries<Data, String>(
          dataSource: mydata,
          color: Colors.blue,
          xValueMapper: (Data Thisdata, _) => Thisdata.name,
          yValueMapper: (Data Thisdata, _) => Thisdata.value,
          dataLabelSettings: DataLabelSettings(
              isVisible: true, textStyle: const TextStyle(fontSize: 10)),
        )
      ],
      tooltipBehavior:
      TooltipBehavior(enable: true, header: '', canShowMarker: false),
    );
  }
}


class DailyCovidGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderColor: Colors.white,
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Today Covid Cases',textStyle: TextStyle(
        color: Colors.white,
      )),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
          labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500
          )
      ),
      primaryYAxis: NumericAxis(
          labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500
          ),
          axisLine: AxisLine(width: 0),
          labelFormat: '{value}',
          majorTickLines: MajorTickLines(size: 0)),
      series: <ColumnSeries<Data, String>>[
        ColumnSeries<Data, String>(
          color: Colors.blue,
          dataSource: myTodaydata,
          xValueMapper: (Data Thisdata, _) => Thisdata.name,
          yValueMapper: (Data Thisdata, _) => Thisdata.value,
          dataLabelSettings: DataLabelSettings(
              isVisible: true, textStyle: const TextStyle(fontSize: 10)),
        )
      ],
      tooltipBehavior:
      TooltipBehavior(enable: true, header: '', canShowMarker: false),
    );
  }
}


List<Data> mydata = [
  Data("Active", StatesCovidDataList[selectedState].Active),
  Data("Recovered", StatesCovidDataList[selectedState].Recovered),
  Data("Confirmed", StatesCovidDataList[selectedState].Confirmed),
  Data("Deaths", StatesCovidDataList[selectedState].Deaths),
];

List<Data> myTodaydata = [
  Data("Confirmed", StatesCovidDataList[selectedState].TodayConfirmed),
  Data("Recovered", StatesCovidDataList[selectedState].TodayRecovered),
  Data("Deaths", StatesCovidDataList[selectedState].TodayDeaths),
];

class Data {
  Data(this.name, this.value);
  final String name;
  final int value;
}

Widget _getDashedLineChart(String text) {

  return IndiaGraph(text);
}

class IndiaGraph extends StatelessWidget {
  String text;
  IndiaGraph(this.text);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderColor: Colors.white,
        plotAreaBorderColor: Colors.white,
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500
            )
        ),
        primaryYAxis: NumericAxis(
            labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500
            )
        ),
        onZoomStart: (val){
          return val;
        },
        series: <LineSeries<PerDayCovidCasesModel, String>>[
          LineSeries<PerDayCovidCasesModel, String>(
            name: "India",
            color: Colors.orange,
            dataSource:  PerDayCovidCasesInIndiaList,
            xValueMapper: (PerDayCovidCasesModel sales, _) => sales.date,
            yValueMapper: (PerDayCovidCasesModel sales, _){
              if(text == "DC") return sales.dailyConfirmed;
              if(text == "DR") return sales.dailyRecovered;
              if(text == "DD") return sales.dailyDeaths;
              if(text == "TC") return sales.Totalconfirmed;
              if(text == "TR") return sales.Totalrecovered;
              return sales.Totaldeaths;
            },
          )]
    );
  }
}