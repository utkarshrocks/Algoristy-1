import 'package:datawiz/variables/variables.dart';
import 'package:flutter/material.dart';

class LoadCovidData extends StatefulWidget {
  @override
  _LoadCovidDataState createState() => _LoadCovidDataState();
}

class _LoadCovidDataState extends State<LoadCovidData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Covid Data"),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                for(var state in India) Container(
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Text("State:" + state.State),
                      Text("Total Active: " + state.Active.toString()),
                      Text("Confirmed: " + state.Confirmed.toString()),
                      Text("Deaths: " + state.Deaths.toString()),
                      Text("Recovered: " + state.Recovered.toString()),
                      Text("Today Confirmed: " + state.TodayConfirmed.toString()),
                      Text("Today Deaths: " + state.TodayDeaths.toString()),
                      Text("Today Recovered: " + state.TodayRecovered.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
    ));
  }
}
