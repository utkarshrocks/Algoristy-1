import 'package:datawiz/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class ChooseStates extends StatefulWidget {
  @override
  _ChooseStatesState createState() => _ChooseStatesState();
}

class _ChooseStatesState extends State<ChooseStates> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: ScreenWidth,
            height: ScreenHeight,
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: VerticalCardPager(
                      titles: StatesNameList,  // required
                      images: Images(), // required
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 1
                      ), // optional
                      onPageChanged: (page) { // optional
                      },
                      onSelectedItem: (index) {
                        setState(() {
                          setState(() {
                            selectedState = index+1;
                          });
                          Navigator.popAndPushNamed(context, CovidIndiaDataRouteCode);
                        });// optional
                      },
                      initialPage: 0,
                      align : ALIGN.CENTER,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
