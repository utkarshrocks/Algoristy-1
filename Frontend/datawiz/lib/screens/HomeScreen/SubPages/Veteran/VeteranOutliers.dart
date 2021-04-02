import 'package:datawiz/Models/VeteranModels/VeteranOutliersModel.dart';
import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VeteranOutliers extends StatefulWidget {
  @override
  _VeteranOutliersState createState() => _VeteranOutliersState();
}

class _VeteranOutliersState extends State<VeteranOutliers> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Veteran Outliers"),
              backgroundColor: Colors.black,
            ),
            body: Container(
              color: Colors.grey[900],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20,),
                    Text("Median: " + scoreOutliersMedian.toString(),style: TextStyle(color: Colors.white),),
                    Text("Lower Bound:" + lowerBoundScoreOutliersMedian.toString(),style: TextStyle(color: Colors.white)),
                    Text("Upper Bound: " + upperBoundScoreOutliersMedian.toString(),style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10,),
                    SfCartesianChart(
                      title: ChartTitle(text: "Score OutLiers Graph",backgroundColor: Colors.white),
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
                      series: _getMultiColoredLineSeries(),
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
                                  Text(ScoreOutliersList[data.pointIndex].facilityID + " : ",style: TextStyle(color: Colors.white),),
                                  Text(data.point.y.toString(),style: TextStyle(color: Colors.white),),
                                ],),
                            );
                          }
                      ),
                    ),

                    SizedBox(height: 20,),

                    Text("Median: " + sampleOutliersMedian.toString(),style: TextStyle(color: Colors.white)),
                    Text("Lower Bound: " + lowerBoundSampleOutliersMedian.toString(),style: TextStyle(color: Colors.white)),
                    Text("Upper Bound: " + upperBoundSampleOutliersMedian.toString(),style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10,),
                    SfCartesianChart(
                      title: ChartTitle(text: "Sample OutLiers Graph",backgroundColor: Colors.white),
                      primaryXAxis: CategoryAxis(
                        majorGridLines: MajorGridLines(width: 0),
                        arrangeByIndex: null,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                      ),
                      primaryYAxis: NumericAxis(
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          )
                      ),
                      borderColor: Colors.white,
                      plotAreaBorderColor: Colors.white,
                      series: _getMultiColoredLineSeries2(),
                      zoomPanBehavior: ZoomPanBehavior(
                        // Enables pinch zooming
                          enablePinching: true
                      ),
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
                                  Text(SampleOutliersList[data.pointIndex].facilityID + " : ",style: TextStyle(color: Colors.white),),
                                  Text(data.point.y.toString(),style: TextStyle(color: Colors.white),),
                                ],),
                            );
                          }
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  List<LineSeries<OutlierClass, String>> _getMultiColoredLineSeries() {
    final List<OutlierClass> chartData = [];
    for(int i=0;i<ScoreOutliersList.length;i++){
      chartData.add(OutlierClass(VeteranOutlierModel(i.toString(), ScoreOutliersList[i].score),
          (
              ScoreOutliersList[i].score < lowerBoundScoreOutliersMedian ||
                  ScoreOutliersList[i].score > upperBoundScoreOutliersMedian
          )?Colors.red:Colors.blue,
          ScoreOutliersList[i].facilityID
      ));
    }
    return <LineSeries<OutlierClass, String>>[
      LineSeries<OutlierClass, String>(
        animationDuration: 2500,
        dataSource: chartData,
        xValueMapper: (OutlierClass sales, _) => _.toString(),
        yValueMapper: (OutlierClass sales, _) => sales.outlier.score,
        pointColorMapper: (OutlierClass sales, _) => sales.ThisColor,
        width: 2,
      )
    ];
  }

  List<LineSeries<OutlierClass, String>> _getMultiColoredLineSeries2() {
    final List<OutlierClass> chartData = [];
    for(int i=0;i<SampleOutliersList.length;i++){
      chartData.add(OutlierClass(VeteranOutlierModel(i.toString(), SampleOutliersList[i].score),
          (
              SampleOutliersList[i].score < lowerBoundSampleOutliersMedian ||
                  SampleOutliersList[i].score > upperBoundSampleOutliersMedian
          )?Colors.red:Colors.blue,
          SampleOutliersList[i].facilityID
      ));
    }
    return <LineSeries<OutlierClass, String>>[
      LineSeries<OutlierClass, String>(
        animationDuration: 2500,
        dataSource: chartData,
        xValueMapper: (OutlierClass sales, _) => _.toString(),
        yValueMapper: (OutlierClass sales, _) => sales.outlier.score,
        pointColorMapper: (OutlierClass sales, _) => sales.ThisColor,
        width: 2,
      )
    ];
  }

}

class OutlierClass{
  VeteranOutlierModel outlier;
  Color ThisColor;
  String facilityname;
  OutlierClass(this.outlier,this.ThisColor,this.facilityname);
}