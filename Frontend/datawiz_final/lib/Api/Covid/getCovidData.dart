import 'dart:convert';
import 'package:datawiz_final/Models/CovidModels/IndianStateModel.dart';
import 'package:datawiz_final/Models/CovidModels/PerDayCovidCasesModel.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> GetCovidData() async {
  var response = await http.get(
    Uri.parse("https://api.covid19india.org/data.json"),
  );

  Map<dynamic, dynamic> res = jsonDecode(response.body.toString());

  StatesCovidDataList.clear();
  PerDayCovidCasesInIndiaList.clear();

  for(var perday in res["cases_time_series"]){
    PerDayCovidCasesModel perdayCovid = PerDayCovidCasesModel();
    perdayCovid.Totalconfirmed = int.parse(perday["totalconfirmed"]);
    perdayCovid.Totaldeaths = int.parse(perday["totaldeceased"]);
    perdayCovid.Totalrecovered = int.parse(perday["totalrecovered"]);
    perdayCovid.dailyConfirmed = int.parse(perday["dailyconfirmed"]);
    perdayCovid.dailyDeaths = int.parse(perday["dailydeceased"]);
    perdayCovid.dailyRecovered = int.parse(perday["dailyrecovered"]);
    perdayCovid.date = perday["dateymd"];
    PerDayCovidCasesInIndiaList.add(perdayCovid);
  }

  for(var state in res["statewise"]){
    IndianStateModel newState = IndianStateModel();
    newState.Active = int.parse(state["active"]);
    newState.Confirmed = int.parse(state["confirmed"]);
    newState.Deaths = int.parse(state["deaths"]);
    newState.Recovered = int.parse(state["recovered"]);
    newState.TodayConfirmed = int.parse(state["deltaconfirmed"]);
    newState.TodayDeaths = int.parse(state["deltadeaths"]);
    newState.TodayRecovered = int.parse(state["deltarecovered"]);
    newState.State = state["state"];
    if(newState.State != "Total") StatesNameList.add(newState.State);
    StatesCovidDataList.add(newState);
  }

  return true;
}