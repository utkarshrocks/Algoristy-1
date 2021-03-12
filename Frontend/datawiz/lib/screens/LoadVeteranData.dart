import 'package:datawiz/variables/variables.dart';
import 'package:flutter/material.dart';

class LoadVeteranData extends StatefulWidget {
  @override
  _LoadVeteranDataState createState() => _LoadVeteranDataState();
}

class _LoadVeteranDataState extends State<LoadVeteranData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Covid Data"),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(VeteranData.toString()),
            ),
          ),
        ));
  }
}
