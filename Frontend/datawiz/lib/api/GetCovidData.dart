import 'dart:convert';

import 'package:datawiz/Models/StateModel.dart';
import 'package:datawiz/variables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> GetCovidData() async {
  var response = await http.get(
    Uri.parse("https://api.covid19india.org/data.json"),
  );

  Map<dynamic, dynamic> res = jsonDecode(response.body.toString());

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
    India.add(newState);
  }

  return true;
}