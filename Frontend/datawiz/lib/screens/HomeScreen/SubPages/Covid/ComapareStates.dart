import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class CompareStates extends StatefulWidget {
  @override
  _CompareStatesState createState() => _CompareStatesState();
}

class _CompareStatesState extends State<CompareStates> {
  String val1 = StatesCovidDataList[0].State;
  String val2 = StatesCovidDataList[1].State;
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  int index1 = 0;
  int index2 = 1;

  List<String> GetList(){
    List<String> IndianStateList = [];
    for(int i=0;i<StatesCovidDataList.length;i++){
      String item = StatesCovidDataList[i].State;
      IndianStateList.add(item);
    }
    return IndianStateList;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Compare States"),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[900],
                      Colors.black,
                      Colors.black,
                      Colors.blue[900],
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              color: Colors.grey[900],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 455,
                      color: Colors.red,
                      child: HorizontalDataTable(
                        leftHandSideColumnWidth: 120,
                        rightHandSideColumnWidth: MediaQuery.of(context).size.width - 120,
                        isFixedHeader: true,
                        headerWidgets: _getTitleWidget(),
                        leftSideItemBuilder: _generateFirstColumnRow,
                        rightSideItemBuilder: _generateRightHandSideColumnRow,
                        itemCount: 7,
                        rowSeparatorWidget: const Divider(
                          color: Colors.grey,
                          height: 1.0,
                          thickness: 0.0,
                        ),
                        leftHandSideColBackgroundColor: Colors.grey[900],
                        rightHandSideColBackgroundColor: Colors.grey[900],
                        enablePullToRefresh: false,
                        htdRefreshController: _hdtRefreshController,
                      ),
                    ),

                    Wrap(
                      children: [
                        myPieChart("Active", getFirstData(StatesCovidDataList[index1].Active,StatesCovidDataList[index2].Active),context),
                        myPieChart("Confirmed", getFirstData(StatesCovidDataList[index1].Confirmed,StatesCovidDataList[index2].Confirmed),context),
                        myPieChart("Recovered", getFirstData(StatesCovidDataList[index1].Recovered,StatesCovidDataList[index2].Recovered),context),
                        myPieChart("Deaths", getFirstData(StatesCovidDataList[index1].Deaths,StatesCovidDataList[index2].Deaths),context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget myPieChart(String text, Map<String, double> x,BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width/2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            height: 1,
          ),
          SizedBox(height: 20,),
          Text(text,style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
          SizedBox(height: 20,),
          PieChart(
            emptyColor: Colors.grey[900],
            dataMap: x,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: 150,
            colorList: [
              Colors.green[900],
              Colors.blue[900],
            ],
            initialAngleInDegree: 0,
            chartType: ChartType.disc,
            legendOptions: LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 0,
            ),
          ),
        ],
      ),
    );
  }

  getFirstData(int var1,int var2){
    Map<String, double> dataMap = {
      StatesCovidDataList[index1].State : var1.toDouble(),
      StatesCovidDataList[index2].State : var2.toDouble(),
    };
    return dataMap;
  }

  getSecondData(){
    List<Data> mydata = [
      Data("Active", StatesCovidDataList[index2].Active),
      Data("Recovered", StatesCovidDataList[index2].Recovered),
      Data("Confirmed", StatesCovidDataList[index2].Confirmed),
      Data("Deaths", StatesCovidDataList[index2].Deaths),
    ];
    return mydata;
  }

  getFirstDataToday(){
    List<Data> myTodaydata = [
      Data("Confirmed", StatesCovidDataList[index1].TodayConfirmed),
      Data("Recovered", StatesCovidDataList[index1].TodayRecovered),
      Data("Deaths", StatesCovidDataList[index1].TodayDeaths),
    ];
    return myTodaydata;
  }

  getSecondDataToday(){
    List<Data> myTodaydata = [
      Data("Confirmed", StatesCovidDataList[index2].TodayConfirmed),
      Data("Recovered", StatesCovidDataList[index2].TodayRecovered),
      Data("Deaths", StatesCovidDataList[index2].TodayDeaths),
    ];
    return myTodaydata;
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {

    String item1 = getData(index1, index);
    String item2 = getData(index2, index);

    return Row(
      children: <Widget>[
        Container(
          child: Center(child: Text(item1,style: TextStyle(color: Colors.white),)),
          width: (MediaQuery.of(context).size.width - 130)/2,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Center(child: Text(item2,style: TextStyle(color: Colors.white))),
          width: (MediaQuery.of(context).size.width - 130)/2,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }

  String getData(int state,int index){
    if(index == 0) return StatesCovidDataList[state].Confirmed.toString();
    if(index == 1) return StatesCovidDataList[state].Active.toString();
    if(index == 2) return StatesCovidDataList[state].Recovered.toString();
    if(index == 3) return StatesCovidDataList[state].Deaths.toString();
    if(index == 4) return StatesCovidDataList[state].TodayConfirmed.toString();
    if(index == 5) return StatesCovidDataList[state].TodayRecovered.toString();
    return StatesCovidDataList[state].TodayDeaths.toString();
  }

  String getDataHeading(int index){
    if(index == 0) return "Confirmed";
    if(index == 1) return "Active";
    if(index == 2) return "Recovered";
    if(index == 3) return "Deaths";
    if(index == 4) return "TodayConfirmed";
    if(index == 5) return "TodayRecovered";
    return "TodayDeaths";
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    String heading = getDataHeading(index);
    return Container(
      child: Text(heading,style: TextStyle(color: Colors.white)),
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      Container(
        child: Text("Sates", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
        height: 85,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        width: (MediaQuery.of(context).size.width - 130)/2,
        height: 85,
        child: DropdownButton<String>(
          itemHeight: 80,
          isExpanded: true,
          autofocus: false,
          dropdownColor: Colors.grey[800],
          value: val1,
          items: GetList().map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(child: Text(value,style: TextStyle(color: Colors.white))),
            );
          }).toList(),
          onChanged: (_) {setState(() {
            val1 = _;
            for(int i=0;i<StatesCovidDataList.length;i++){
              if(StatesCovidDataList[i].State == _){
                index1 = i;
                break;
              }
            }

          });},
        ),
      ),
      Container(
        height: 85,
        width:  (MediaQuery.of(context).size.width - 130)/2,
        child: DropdownButton<String>(
          itemHeight: 80,
          isExpanded: true,
          dropdownColor: Colors.grey[800],
          autofocus: false,
          value: val2,
          items: GetList().map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(child: Text(value,style: TextStyle(color: Colors.white))),
            );
          }).toList(),
          onChanged: (_) {setState(() {
            val2 = _;
            for(int i=0;i<StatesCovidDataList.length;i++){
              if(StatesCovidDataList[i].State == _){
                index2 = i;
                break;
              }
            }
          });},
        ),
      )
    ];
  }
}

class Data {
  Data(this.name, this.value);
  final String name;
  final int value;
}