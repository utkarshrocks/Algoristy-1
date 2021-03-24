import 'package:datawiz/Models/IndiaCovidPerDay.dart';
import 'package:datawiz/Models/StateModel.dart';
import 'package:datawiz/Models/veteranModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

List<IndianState> India = [];
List<String> IndiaStatesList = [];
int selectedState = 0;
List<CovidPerDay> IndiaCovidPerDay = [];
List<VeteranModel> VeteranDataList = [];

TextStyle FontStyle(){
  return TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600
  );
}

int finalLength = 10;
int StartIndex = 0;
int NumberTiles = 10;
int CurrentPage = 0;

TextStyle FontStyle2(){
  return TextStyle(
      fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
  );
}

TextStyle FontStyle3(){
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.red,
  );
}

int min(int a, int b) {
  return (a > b)?b:a;
}

int max(int a, int b) {
  return (a > b)?a:b;
}