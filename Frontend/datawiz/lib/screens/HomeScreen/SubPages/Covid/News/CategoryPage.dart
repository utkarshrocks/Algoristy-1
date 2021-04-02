import 'package:datawiz/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';

class ChannelPage extends StatefulWidget {

  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {

  Widget show_tile(String name){
    return GestureDetector(
      onTap: () {
        if(name == "all"){
          setState(() {
            data.Category_search = false;
            data.Country_search = false;
            data.search_querry = true;
          });
          Navigator.of(context).pop(true);
          Navigator.pushNamed(context, CovidNewsRouteCode);
        }else{
          setState(() {
            data.Category_search = true;
            data.channel = name;
            data.Country_search = false;
            data.search_querry = false;
          });
          Navigator.of(context).pop(true);
          Navigator.pushNamed(context, CovidNewsRouteCode);
        }
      },
      child: Channel_Tile(name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Channel"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Wrap(
            children: [
              show_tile("all"),
              show_tile("bbc.com"),
              show_tile("cgtn.com"),
              show_tile("dnaindia.com"),
              show_tile("firstpost.com"),
              show_tile("foxnews.com"),
              show_tile("indiatvnews.com"),
              show_tile("indiatoday.in"),
              show_tile("news18.com"),
              show_tile("ndtv.com"),
              show_tile("newsonair.com"),
              show_tile("oneindia.com"),
              show_tile("republicworld.com"),
              show_tile("techcrunch.com"),
              show_tile("timesnownews.com"),
              show_tile("thewire.in"),
              show_tile("thehindu.com"),
              show_tile("thequint.com"),
              show_tile("wionews.com"),
              show_tile("9news.com.au"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Channel_Tile(String name){
  return Container(
    margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
    height: 130.0,
    width: 160.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        ClipRect(
          child: Image.asset(
            "Assets/Images/newschannel/${name.split(".")[0]}.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}