//others
import 'package:datawiz_final/Api/Covid/News.dart';

String SplashScreenRouteCode = "/splashscreen";
String GetstartedRouteCode = "/getstarted";
String HomePageRouteCode = "/homepage";
String AboutUsRouteCode = HomePageRouteCode + "/aboutus";
String ContributionRouteCode = HomePageRouteCode + "/contributions";

//covid
String CovidIndiaDataRouteCode = HomePageRouteCode + "/coviddata";
String CovidDataRouteCode = CovidIndiaDataRouteCode + "/state";
String CovidNewsRouteCode = HomePageRouteCode + "/covid/news";
String CovidOutliersRouteCode = HomePageRouteCode + "/covid/outliers";
String CovidCompareRouteCode = HomePageRouteCode + "/covid/compare/states";
String CovidPredictionRouteCode = HomePageRouteCode + "/covid/predict";

//veteran
String VeteranDataRouteCode = HomePageRouteCode + "/veterandata";
String VeteranOutliersRouteCode = HomePageRouteCode + "/veteran/outliers";

//news
String CountryNewsRouteCode = CovidNewsRouteCode + "/Country";
String ChannelNewsRouteCode = CovidNewsRouteCode + "/Channel";
String WorldomerRouteCode = CovidNewsRouteCode + "/worldometer";
String FullNewsRouteCode = CovidNewsRouteCode + "/news/fullnews";