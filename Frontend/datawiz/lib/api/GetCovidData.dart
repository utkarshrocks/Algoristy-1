import 'dart:convert';
import 'package:datawiz/Models/IndiaCovidPerDay.dart';
import 'package:datawiz/Models/StateModel.dart';
import 'package:datawiz/variables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> GetCovidData() async {
  var response = await http.get(
    Uri.parse("https://api.covid19india.org/data.json"),
  );

  Map<dynamic, dynamic> res = jsonDecode(response.body.toString());

  India.clear();
  IndiaCovidPerDay.clear();

  for(var perday in res["cases_time_series"]){
    CovidPerDay perdayCovid = CovidPerDay();
    perdayCovid.Totalconfirmed = int.parse(perday["totalconfirmed"]);
    perdayCovid.Totaldeaths = int.parse(perday["totaldeceased"]);
    perdayCovid.Totalrecovered = int.parse(perday["totalrecovered"]);
    perdayCovid.dailyConfirmed = int.parse(perday["dailyconfirmed"]);
    perdayCovid.dailyDeaths = int.parse(perday["dailydeceased"]);
    perdayCovid.dailyRecovered = int.parse(perday["dailyrecovered"]);
    perdayCovid.date = perday["dateymd"];
    IndiaCovidPerDay.add(perdayCovid);
  }

  for(var state in res["statewise"]){
    IndianState newState = IndianState();
    newState.Active = int.parse(state["active"]);
    newState.Confirmed = int.parse(state["confirmed"]);
    newState.Deaths = int.parse(state["deaths"]);
    newState.Recovered = int.parse(state["recovered"]);
    newState.TodayConfirmed = int.parse(state["deltaconfirmed"]);
    newState.TodayDeaths = int.parse(state["deltadeaths"]);
    newState.TodayRecovered = int.parse(state["deltarecovered"]);
    newState.State = state["state"];
    if(newState.State != "Total") IndiaStatesList.add(newState.State);
    India.add(newState);
  }

  return true;
}