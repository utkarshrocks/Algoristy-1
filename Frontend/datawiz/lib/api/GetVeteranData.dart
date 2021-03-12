import 'dart:convert';
import 'package:datawiz/variables/variables.dart';
import 'package:http/http.dart' as http;

Future<bool> GetVeteranData() async {
  var response = await http.get(
    Uri.parse("https://data.medicare.gov/api/views/6qxe-iqz8/rows.json?accessType=DOWNLOAD"),
  );
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  VeteranData.addAll(res);
  return true;
}