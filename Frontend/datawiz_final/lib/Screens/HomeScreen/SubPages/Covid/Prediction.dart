import 'package:datawiz_final/Models/CovidModels/PerDayCovidCasesModel.dart';
import 'package:datawiz_final/SettingsAndVariables/Util/Fontstyles.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';

class Prediction extends StatefulWidget {
  @override
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {


  List<PerDayCovidCasesModel> PredictedList = [];

  @override
  void initState() {

    PerDayCovidCasesModel AvgModel = PerDayCovidCasesModel();
    PerDayCovidCasesModel AvgModel2 = PerDayCovidCasesModel();

    AvgModel.Totalrecovered = 0;
    AvgModel.Totalconfirmed = 0;
    AvgModel.Totaldeaths = 0;
    AvgModel.dailyRecovered = 0;
    AvgModel.dailyConfirmed = 0;
    AvgModel.dailyDeaths = 0;
    int size = PerDayCovidCasesInIndiaList.length-1;
    for(int i=size;i>=size-4;i--){
      AvgModel.Totalrecovered += PerDayCovidCasesInIndiaList[i].Totalrecovered - PerDayCovidCasesInIndiaList[i-1].Totalrecovered;
      AvgModel.Totalconfirmed += PerDayCovidCasesInIndiaList[i].Totalconfirmed - PerDayCovidCasesInIndiaList[i-1].Totalconfirmed;
      AvgModel.Totaldeaths += PerDayCovidCasesInIndiaList[i].Totaldeaths - PerDayCovidCasesInIndiaList[i-1].Totaldeaths;
      AvgModel.dailyRecovered += PerDayCovidCasesInIndiaList[i].dailyRecovered - PerDayCovidCasesInIndiaList[i-1].dailyRecovered;
      AvgModel.dailyConfirmed += PerDayCovidCasesInIndiaList[i].dailyConfirmed - PerDayCovidCasesInIndiaList[i-1].dailyConfirmed;
      AvgModel.dailyDeaths += PerDayCovidCasesInIndiaList[i].dailyDeaths - PerDayCovidCasesInIndiaList[i-1].dailyDeaths;
    }
    AvgModel.Totalrecovered ~/= 5;
    AvgModel.Totalconfirmed ~/= 5;
    AvgModel.Totaldeaths ~/= 5;
    AvgModel.dailyRecovered ~/= 5;
    AvgModel.dailyConfirmed ~/= 5;
    AvgModel.dailyDeaths ~/= 5;

    AvgModel2.Totalrecovered = AvgModel.Totalrecovered + PerDayCovidCasesInIndiaList[size].Totalrecovered;
    AvgModel2.Totalconfirmed = AvgModel.Totalconfirmed + PerDayCovidCasesInIndiaList[size].Totalconfirmed;
    AvgModel2.Totaldeaths = AvgModel.Totaldeaths + PerDayCovidCasesInIndiaList[size].Totaldeaths;
    AvgModel2.dailyRecovered = AvgModel.dailyRecovered + PerDayCovidCasesInIndiaList[size].dailyRecovered;
    AvgModel2.dailyConfirmed = AvgModel.dailyConfirmed + PerDayCovidCasesInIndiaList[size].dailyConfirmed;
    AvgModel2.dailyDeaths = AvgModel.dailyDeaths + PerDayCovidCasesInIndiaList[size].dailyDeaths;

    setState(() {
      PredictedList.add(AvgModel2.copy(AvgModel2));
      for(int i=1;i <= 4;i++){
        AvgModel2.Totalrecovered = AvgModel.Totalrecovered*5*i + PerDayCovidCasesInIndiaList[size].Totalrecovered;
        AvgModel2.Totalconfirmed = AvgModel.Totalconfirmed*5*i + PerDayCovidCasesInIndiaList[size].Totalconfirmed;
        AvgModel2.Totaldeaths = AvgModel.Totaldeaths*5*i + PerDayCovidCasesInIndiaList[size].Totaldeaths;
        AvgModel2.dailyRecovered = AvgModel.dailyRecovered*5*i + PerDayCovidCasesInIndiaList[size].dailyRecovered;
        AvgModel2.dailyConfirmed = AvgModel.dailyConfirmed*5*i + PerDayCovidCasesInIndiaList[size].dailyConfirmed;
        AvgModel2.dailyDeaths = AvgModel.dailyDeaths*5*i + PerDayCovidCasesInIndiaList[size].dailyDeaths;
        PredictedList.add(AvgModel2.copy(AvgModel2));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Prediction"),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[900],
                    Colors.black,
                    Colors.black,
                    Colors.blue[900],
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            color: Colors.grey[900],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Today Data: ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30)),
                      SizedBox(height: 20,),
                      Data(PerDayCovidCasesInIndiaList, PerDayCovidCasesInIndiaList.length-1),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Text("After 1 Day: ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30)),
                      SizedBox(height: 20,),
                      Data(PredictedList, 0),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Text("After 5 Day: ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30)),
                      SizedBox(height: 20,),
                      Data(PredictedList, 1),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Text("After 10 Day: ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30)),
                      SizedBox(height: 20,),
                      Data(PredictedList, 2),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Text("After 15 Day: ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30)),
                      SizedBox(height: 20,),
                      Data(PredictedList, 3),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Text("After 20 Day: ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30)),
                      SizedBox(height: 20,),
                      Data(PredictedList, 4),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget Data(List<PerDayCovidCasesModel> list, int index){
    return Column(
      children: [
        for(int i=0;i<PredictNames.length;i++)
        Row(
          children: [
            Text(PredictNames[i],style: FontStyle(),),
            Text(PredictStrings(list[index])[i],style: FontStyle3(IndiaShowDataColor[i]),),
          ],
        ),
      ],
    );
  }
}
