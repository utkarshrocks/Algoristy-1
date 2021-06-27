import 'package:datawiz_final/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';

List<String> country_name = ["in", "us", "ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn", "co", "cu", "eg", "fr", "gb", "gr", "hk", "hu",
  "id", "it", "kr", "lt", "ma", "mx", "my", "ng", "nl", "no", "nz", "pl", "ro", "rs", "sa", "se", "sg", "si", "sk", "th", "tw", "ve", "za"];

class CountryPage extends StatefulWidget {

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Country"),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[800],
          child: Wrap(
            children: [
              for (String i in country_name)
                (GestureDetector(
                  onTap: (){
                    setState(() {
                      data.Country = i;
                      data.search_querry = false;
                      data.Category_search = false;
                      data.Country_search = true;
                      Navigator.of(context).pop(true);
                      Navigator.pushNamed(context, CovidNewsRouteCode);
                    });
                  },
                  child: Country_Tile(i),
                ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget Country_Tile(String name){
  return Container(
    margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 15.0,bottom: 15.0),
    height: 45.0,
    width: 100.0,
    child: Center(child: Image.network("https://www.worldometers.info/img/flags/${name}-flag.gif")),
  );
}