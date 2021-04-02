import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';

class Contribution extends StatefulWidget {
  @override
  _ContributionState createState() => _ContributionState();
}

class _ContributionState extends State<Contribution> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: ScreenWidth,
          height: ScreenHeight,
          color: Colors.red,
        ),
      ),
    );
  }
}
