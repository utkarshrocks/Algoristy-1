import 'dart:convert';
import 'package:datawiz/Models/VeteranModels/VeteranModel.dart';
import 'package:datawiz/Models/VeteranModels/VeteranOutliersModel.dart';
import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> GetVeteranData() async {
  var response = await http.get(
    Uri.parse("https://data.medicare.gov/api/views/6qxe-iqz8/rows.json?accessType=DOWNLOAD"),
  );
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());

  VeteranDataList.clear();
  ScoreOutliersList.clear();
  SampleOutliersList.clear();

  for(var facility in res["data"]){
    VeteranModel VeteranFacility = VeteranModel.fromJson(List.from(facility));
    VeteranDataList.add(VeteranFacility);
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