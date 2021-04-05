import 'package:datawiz_final/Models/CovidModels/CovidOutlierModel.dart';
import 'package:datawiz_final/SettingsAndVariables/Util/RightData.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CovidOutliers extends StatefulWidget {
  @override
  _CovidOutliersState createState() => _CovidOutliersState();
}

class _CovidOutliersState extends State<CovidOutliers> {

  @override
  void initState() {
    GetAllData();
    super.initState();
  }

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
                  GetMyGraph(CovidOutliersListA, "Active"),
                  GetMyGraph(CovidOutliersListR, "Recovered"),
                  GetMyGraph(CovidOutliersListC, "Confirmed"),
                  GetMyGraph(CovidOutliersListD, "Deaths"),
                  GetMyGraph(CovidOutliersListTR, "Today Recovered"),
                  GetMyGraph(CovidOutliersListTC, "Today Confirmed"),
                  GetMyGraph(CovidOutliersListTD, "Today Deaths"),
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget GetMyGraph(List<CovidOutlierModel> thislist, String text){
    return Column(
      children: [
        SizedBox(height: 10,),
        Text("median: " + thislist[0].median.toString(),style: TextStyle(color: Colors.white),),
        Text("Lower Bound: " + thislist[0].lowerbound.toString(),style: TextStyle(color: Colors.white)),
        Text("Upper Bound: " + thislist[0].upperbound.toString(),style: TextStyle(color: Colors.white)),
        SizedBox(height: 10,),
        SfCartesianChart(
          title: ChartTitle(text: text + " OutLiers Graph",backgroundColor: Colors.white),
          primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
              arrangeByIndex: null,
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              )
          ),
          primaryYAxis: NumericAxis(
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              )
          ),
          series: _getMultiColoredLineSeries(thislist),
          zoomPanBehavior: ZoomPanBehavior(
              enablePinching: true
          ),
          borderColor: Colors.white,
          plotAreaBorderColor: Colors.white,
          trackballBehavior: TrackballBehavior(
              enable: true,
              hideDelay: 0.0,
              builder: (BuildContext context, TrackballDetails data) {
                return Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 8, 22, 0.75),
                    borderRadius:
                    BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 100,
                          child: Text(data.point.x + " : ",style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,)),
                      Text(data.point.y.toString(),style: TextStyle(color: Colors.white),),
                    ],),
                );
              }
          ),
        ),
      ],
    );
  }

  List<LineSeries<OutlierClass, String>> _getMultiColoredLineSeries(List<CovidOutlierModel> thislist) {
    final List<OutlierClass> chartData = [];
    for(int i=0;i<thislist.length;i++){
      chartData.add(OutlierClass(thislist[i].score,
          (thislist[i].score >= thislist[0].lowerbound.toInt()  && thislist[i].score <= thislist[0].upperbound.toInt())?
              Colors.blue:Colors.red,
          thislist[i].state));
    }
    return <LineSeries<OutlierClass, String>>[
      LineSeries<OutlierClass, String>(
        animationDuration: 2500,
        dataSource: chartData,
        xValueMapper: (OutlierClass sales, _) => sales.facilityname,
        yValueMapper: (OutlierClass sales, _) => sales.value,
        pointColorMapper: (OutlierClass sales, _) => sales.ThisColor,
        width: 2,
      )
    ];
  }

}

class OutlierClass{
  int value;
  Color ThisColor;
  String facilityname;
  OutlierClass(this.value,this.ThisColor,this.facilityname);
}
