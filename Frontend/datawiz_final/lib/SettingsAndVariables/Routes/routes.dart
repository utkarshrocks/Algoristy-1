import 'package:datawiz_final/Screens/HomeScreen/HomeScreen.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Covid/ComapareStates.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Covid/LoadCovidInfo.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Covid/News/CategoryPage.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Covid/News/CountryNews.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Covid/News/CovidNews.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Covid/News/FullNews.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Covid/News/Worldometer.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Covid/Outliers.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Others/AboutUs.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Others/Contribution.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Veteran/LoadVetranInfo.dart';
import 'package:datawiz_final/Screens/HomeScreen/SubPages/Veteran/VeteranOutliers.dart';
import 'package:datawiz_final/Screens/SplashScreens/GetStartedScreen.dart';
import 'package:datawiz_final/Screens/SplashScreens/SplashScreen.dart';
import 'package:datawiz_final/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:flutter/material.dart';

var routes = <String,WidgetBuilder>{
  //others
  SplashScreenRouteCode : (BuildContext context) => SplashScreen(),
  GetstartedRouteCode : (BuildContext context) => GetStarted(),
  HomePageRouteCode : (BuildContext context) => HomePage(),
  AboutUsRouteCode : (BuildContext context) => AboutUs(),
  ContributionRouteCode : (BuildContext context) => Contribution(),

  //covid
  CovidIndiaDataRouteCode : (BuildContext context) => LoadCovidInfo(),
  CovidNewsRouteCode : (BuildContext context) => CovidNews(),
  CovidCompareRouteCode : (BuildContext context) => CompareStates(),
  CovidOutliersRouteCode : (BuildContext context) => CovidOutliers(),

  //veteran
  VeteranDataRouteCode : (BuildContext context) => LoadVeteranInfo(),
  VeteranOutliersRouteCode : (BuildContext context) => VeteranOutliers(),

  //news
  ChannelNewsRouteCode : (BuildContext context) => ChannelPage(),
  CountryNewsRouteCode : (BuildContext context) => CountryPage(),
  FullNewsRouteCode : (BuildContext context) => WebPage(),
  WorldomerRouteCode : (BuildContext context) => worldometer()
};