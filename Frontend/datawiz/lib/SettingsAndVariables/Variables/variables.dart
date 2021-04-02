import 'package:datawiz/Api/Covid/News.dart';
import 'package:datawiz/Models/CovidModels/Article.dart';
import 'package:datawiz/Models/CovidModels/CovidOutlierModel.dart';
import 'package:datawiz/Models/CovidModels/IndianStateModel.dart';
import 'package:datawiz/Models/CovidModels/PerDayCovidCasesModel.dart';
import 'package:datawiz/Models/VeteranModels/VeteranModel.dart';
import 'package:datawiz/Models/VeteranModels/VeteranOutliersModel.dart';
import 'package:datawiz/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:flutter/material.dart';

//list of color
List<Color> ColorList = [
  Colors.red[400],
  Colors.green[400],
  Colors.blue[400],
  Colors.yellow[400],
];

//covid Variables
List<IndianStateModel> StatesCovidDataList = [];
List<String> StatesNameList = [];
List<CovidOutlierModel> CovidOutliersListA = [];
List<CovidOutlierModel> CovidOutliersListD = [];
List<CovidOutlierModel> CovidOutliersListC = [];
List<CovidOutlierModel> CovidOutliersListR = [];
List<CovidOutlierModel> CovidOutliersListTD = [];
List<CovidOutlierModel> CovidOutliersListTR = [];
List<CovidOutlierModel> CovidOutliersListTC = [];
List<PerDayCovidCasesModel> PerDayCovidCasesInIndiaList = [];
List<Color> IndiaShowDataColor = [
  Colors.red,
  Colors.red,
  Colors.red,
  Colors.blue,
  Colors.red,
  Colors.red,
  Colors.blue,
  Colors.blue,
  Colors.red,
];
List<String> IndiaShowDataNames = ["Total Active:  ", "Confirmed:  ", "Deaths:  ",
  "Recovered:  ", "Today Confirmed:  ", "Today Deaths:  ", "Today Recovered:  ", "Recovered Rate:  ", "Death Rate:  "];
List<String> GetSelectedStateData(){
  List<String> IndiaShowData = [
    StatesCovidDataList[selectedState].Active.toString(),
    StatesCovidDataList[selectedState].Confirmed.toString(),
    StatesCovidDataList[selectedState].Deaths.toString(),
    StatesCovidDataList[selectedState].Recovered.toString(),
    StatesCovidDataList[selectedState].TodayConfirmed.toString(),
    StatesCovidDataList[selectedState].TodayDeaths.toString(),
    StatesCovidDataList[selectedState].TodayRecovered.toString(),
    ((StatesCovidDataList[selectedState].Recovered*100)/StatesCovidDataList[selectedState].Confirmed).toStringAsFixed(2) + "%",
    ((StatesCovidDataList[selectedState].Deaths*100)/StatesCovidDataList[selectedState].Confirmed).toStringAsFixed(2) + "%",
  ];
  return IndiaShowData;
}
int selectedState = 0;

List<Widget> Images(){
  List<Widget> images = [];
  for(int i=0;i<StatesNameList.length;i++)
    images.add(Container(child: Image.asset("Assets/Images/IndiaImages/IndiaImage${(i%5)+1}.jpg",fit: BoxFit.fill,),));

  return images;
}

//veteran variables

int VeteranDataLength = 0;
List<VeteranModel> VeteranDataList = [];

List<VeteranOutlierModel> ScoreOutliersList = [];
double scoreOutliersMedian;
double lowerBoundScoreOutliersMedian;
double upperBoundScoreOutliersMedian;

List<VeteranOutlierModel> SampleOutliersList = [];
double sampleOutliersMedian;
double lowerBoundSampleOutliersMedian;
double upperBoundSampleOutliersMedian;

int StartIndex = 0;
int NumberTiles = 20;
int finalLength = 10;

//other variables
double ScreenWidth;
double ScreenHeight;

List<String> Imagesname = ["covidImage", "VeteranImage", "Outliers", "CovidNews"];
List<String> ImagesnameHomepage = ["covidImage", "VeteranImage", "CovidNews", "about-us", "contribution"];
List<String> RoutenamesHomepage = [
  CovidIndiaDataRouteCode,
  VeteranDataRouteCode,
  CovidNewsRouteCode,
  AboutUsRouteCode,
  ContributionRouteCode];
List<String> respectiveTaglines = ["Covid Data Of India", "Veteran Data", "Outliers of Covid \nAnd Veteran Data", "Covid News"];

//Covid getnews
List<Article> articles = [];
getnews News = getnews();
Data data = Data();
String newsUrl;