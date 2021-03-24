import 'package:datawiz/Models/IndiaCovidPerDay.dart';
import 'package:datawiz/variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart' as pie;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class LoadCovidData extends StatefulWidget {
  @override
  _LoadCovidDataState createState() => _LoadCovidDataState();
}

class _LoadCovidDataState extends State<LoadCovidData> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Covid Data"),
            ),
            drawer: Drawer(
              child: Container(
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                        decoration: BoxDecoration(
                            color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/images.png"), fit: BoxFit.fill),
                              ),
                            ),

                            SizedBox(height: 10,),
                            Text("DataWiz", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18
                            ),),
                          ],
                        )
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, "/comparecoviddata");
                        });
                      },
                      child: ListTile(
                        title: Text("Compare States",),
                        leading: Container(
                          height: 30,
                          width: 30,
                          child: Icon(Icons.compare),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedState = 0;
                          Navigator.of(context).pop();
                        });
                      },
                      child: ListTile(
                        title: Text("INDIA",style: TextStyle(fontSize: 30),),
                        leading: Container(
                          height: 30,
                          width: 30,
                          child: Icon(Icons.place),
                        ),
                      ),
                    ),
                    for(int i=1;i<India.length;i++)
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedState = i;
                          Navigator.of(context).pop();
                        });
                      },
                      child: ListTile(
                        title: Text(India[i].State),
                        leading: Container(
                          height: 30,
                          width: 30,
                          child: Icon(Icons.place),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("INDIA",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),)),
                    if(selectedState != 0) Center(child: Text(India[selectedState].State,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("Total Active:  ",style: FontStyle(),),
                        Text(India[selectedState].Active.toString(),style: FontStyle3(),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Confirmed:  ",style: FontStyle(),),
                        Text(India[selectedState].Confirmed.toString(),style: FontStyle3(),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Deaths:  ",style: FontStyle(),),
                        Text(India[selectedState].Deaths.toString(),style: FontStyle3(),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Recovered:  ",style: FontStyle(),),
                        Text(India[selectedState].Recovered.toString(),style: FontStyle2(),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Today Confirmed:  ",style: FontStyle(),),
                        Text(India[selectedState].TodayConfirmed.toString(),style: FontStyle3(),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Today Deaths:  ",style: FontStyle(),),
                        Text(India[selectedState].TodayDeaths.toString(),style: FontStyle3(),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Today Recovered:  ",style: FontStyle(),),
                        Text(India[selectedState].TodayRecovered.toString(),style: FontStyle2(),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Recovered Rate:  ",style: FontStyle(),),
                        Text(((India[selectedState].Recovered*100)/India[selectedState].Confirmed).toStringAsFixed(2) + "%",style: FontStyle2(),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Death Rate:  ",style: FontStyle(),),
                        Text(((India[selectedState].Deaths*100)/India[selectedState].Confirmed).toStringAsFixed(2) + "%",style: FontStyle3(),),
                      ],
                    ),
                    (selectedState == 0)?Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40,),
                        Text("Total Confirmed",style: FontStyle3()),
                        _getDashedLineChart("TC"),

                        SizedBox(height: 40,),
                        Text("Total Recovered",style: FontStyle2()),
                        _getDashedLineChart("TR"),

                        SizedBox(height: 40,),
                        Text("Total Deaths",style: FontStyle3()),
                        _getDashedLineChart("TD"),

                        SizedBox(height: 40,),
                        Text("Daily Confirmed",style: FontStyle3(),),
                        _getDashedLineChart("DC"),

                        SizedBox(height: 40,),
                        Text("Daily Recovered",style: FontStyle2()),
                        _getDashedLineChart("DR"),

                        SizedBox(height: 40,),
                        Text("Daily Deaths",style: FontStyle3()),
                        _getDashedLineChart("DD"),
                      ],
                    ):Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                              height: 400,
                              child: SfCartesianChart(
                                plotAreaBorderWidth: 0,
                                title: ChartTitle(
                                    text: 'Total Covid Cases'),
                                primaryXAxis: CategoryAxis(
                                  majorGridLines: MajorGridLines(width: 0),
                                ),
                                primaryYAxis: NumericAxis(
                                    axisLine: AxisLine(width: 0),
                                    labelFormat: '{value}',
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
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                              height: 400,
                              child: SfCartesianChart(
                                plotAreaBorderWidth: 0,
                                title: ChartTitle(
                                    text: 'Today Covid Cases'),
                                primaryXAxis: CategoryAxis(
                                  majorGridLines: MajorGridLines(width: 0),
                                ),
                                primaryYAxis: NumericAxis(
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      )),
    );
  }

  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

}

List<Data> mydata = [
  Data("Active", India[selectedState].Active),
  Data("Recovered", India[selectedState].Recovered),
  Data("Confirmed", India[selectedState].Confirmed),
  Data("Deaths", India[selectedState].Deaths),
];

List<Data> myTodaydata = [
  Data("Confirmed", India[selectedState].TodayConfirmed),
  Data("Recovered", India[selectedState].TodayRecovered),
  Data("Deaths", India[selectedState].TodayDeaths),
];

class Data {
  Data(this.name, this.value);
  final String name;
  final int value;
}

SfCartesianChart _getDashedLineChart(String text) {

  return SfCartesianChart(

      tooltipBehavior: TooltipBehavior(enable: true),
      primaryXAxis: CategoryAxis(),
      onZoomStart: (val){
        return val;
      },
      series: <LineSeries<CovidPerDay, String>>[
      LineSeries<CovidPerDay, String>(
          name: "India",
      color: Colors.orange,
      dataSource:  IndiaCovidPerDay,
      xValueMapper: (CovidPerDay sales, _) => sales.date,
      yValueMapper: (CovidPerDay sales, _){
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