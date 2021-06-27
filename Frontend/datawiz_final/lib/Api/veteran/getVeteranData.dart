import 'dart:convert';
import 'package:datawiz_final/Models/VeteranModels/VeteranModel.dart';
import 'package:datawiz_final/Models/VeteranModels/VeteranOutliersModel.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> GetVeteranData(BuildContext context) async {
  // var response = await http.get(
  //   Uri.parse("https://data.medicare.gov/api/views/6qxe-iqz8/rows.json?accessType=DOWNLOAD"),
  // );
  String data = await DefaultAssetBundle.of(context).loadString("lib/Api/veteran/veteran.json");
  Map<dynamic, dynamic> res = await jsonDecode(data);

  VeteranDataList.clear();
  ScoreOutliersList.clear();
  SampleOutliersList.clear();

  for(var facility in res["data"]){
    VeteranModel VeteranFacility = VeteranModel.fromJson(facility);
    VeteranDataList.add(VeteranFacility);
    // print(VeteranFacility.location);
    VeteranOutlierModel ThisOutlier = VeteranOutlierModel(
        VeteranFacility.facilityId,
        (VeteranFacility.score == "Not Available")?0:double.parse(VeteranFacility.score)
    );
    VeteranOutlierModel ThisSampleOutlier = VeteranOutlierModel(
        VeteranFacility.facilityId,
        (VeteranFacility.sample == "Not Available")?0:double.parse(VeteranFacility.sample)
    );
    SampleOutliersList.add(ThisSampleOutlier);
    ScoreOutliersList.add(ThisOutlier);
  }

  VeteranDataLength = VeteranDataList.length;
  return true;
}