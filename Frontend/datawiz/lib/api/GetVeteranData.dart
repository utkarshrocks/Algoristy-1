import 'dart:convert';
import 'package:datawiz/Models/veteranModel.dart';
import 'package:datawiz/variables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> GetVeteranData() async {
  var response = await http.get(
    Uri.parse("https://data.medicare.gov/api/views/6qxe-iqz8/rows.json?accessType=DOWNLOAD"),
  );
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  VeteranDataList.clear();
  for(var facility in res["data"]){
    VeteranModel VeteranFacility = VeteranModel.fromJson(List.from(facility));
    VeteranDataList.add(VeteranFacility);
  }
  finalLength = VeteranDataList.length;
  return true;
}