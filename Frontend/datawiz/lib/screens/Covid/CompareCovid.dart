import 'package:datawiz/variables/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:pie_chart/pie_chart.dart';

class CompareCovid extends StatefulWidget {
  @override
  _CompareCovidState createState() => _CompareCovidState();
}

class _CompareCovidState extends State<CompareCovid> {

  String val1 = India[0].State;
  String val2 = India[1].State;
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  int index1 = 0;
  int index2 = 1;

  List<String> GetList(){
    List<String> IndianStateList = [];
    for(int i=0;i<India.length;i++){
      String item = India[i].State;
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
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 410,
                      color: Colors.red,
                      child: HorizontalDataTable(
                        leftHandSideColumnWidth: 150,
                        rightHandSideColumnWidth: MediaQuery.of(context).size.width - 150,
                        isFixedHeader: true,
                        headerWidgets: _getTitleWidget(),
                        leftSideItemBuilder: _generateFirstColumnRow,
                        rightSideItemBuilder: _generateRightHandSideColumnRow,
                        itemCount: 7,
                        rowSeparatorWidget: const Divider(
                          color: Colors.black54,
                          height: 1.0,
                          thickness: 0.0,
                        ),
                        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
                        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                        enablePullToRefresh: false,
                        htdRefreshController: _hdtRefreshController,
                      ),
                    ),

                    Wrap(
                      children: [
                        myPieChart("Active", getFirstData(India[index1].Active,India[index2].Active),context),
                        myPieChart("Confirmed", getFirstData(India[index1].Confirmed,India[index2].Confirmed),context),
                        myPieChart("Recovered", getFirstData(India[index1].Recovered,India[index2].Recovered),context),
                        myPieChart("Deaths", getFirstData(India[index1].Deaths,India[index2].Deaths),context),
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
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20,),
          PieChart(
            dataMap: x,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: 150,
            colorList: [
              Colors.green,
              Colors.blue,
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
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: true,
              decimalPlaces: 0,
            ),
          ),
        ],
      ),
    );
  }

  getFirstData(int var1,int var2){
    Map<String, double> dataMap = {
      India[index1].State : var1.toDouble(),
      India[index2].State : var2.toDouble(),
    };
    return dataMap;
  }

  getSecondData(){
    List<Data> mydata = [
      Data("Active", India[index2].Active),
      Data("Recovered", India[index2].Recovered),
      Data("Confirmed", India[index2].Confirmed),
      Data("Deaths", India[index2].Deaths),
    ];
    return mydata;
  }

  getFirstDataToday(){
    List<Data> myTodaydata = [
      Data("Confirmed", India[index1].TodayConfirmed),
      Data("Recovered", India[index1].TodayRecovered),
      Data("Deaths", India[index1].TodayDeaths),
    ];
    return myTodaydata;
  }

  getSecondDataToday(){
    List<Data> myTodaydata = [
      Data("Confirmed", India[index2].TodayConfirmed),
      Data("Recovered", India[index2].TodayRecovered),
      Data("Deaths", India[index2].TodayDeaths),
    ];
    return myTodaydata;
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {

    String item1 = getData(index1, index);
    String item2 = getData(index2, index);

    return Row(
      children: <Widget>[
        Container(
          child: Center(child: Text(item1)),
          width: (MediaQuery.of(context).size.width - 150)/2,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Center(child: Text(item2)),
          width: (MediaQuery.of(context).size.width - 150)/2,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }

  String getData(int state,int index){
    if(index == 0) return India[state].Confirmed.toString();
    if(index == 1) return India[state].Active.toString();
    if(index == 2) return India[state].Recovered.toString();
    if(index == 3) return India[state].Deaths.toString();
    if(index == 4) return India[state].TodayConfirmed.toString();
    if(index == 5) return India[state].TodayRecovered.toString();
    return India[state].TodayDeaths.toString();
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
      child: Text(heading),
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      Container(
        child: Text("Sates", style: TextStyle(fontWeight: FontWeight.bold)),
        height: 48,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        width: (MediaQuery.of(context).size.width - 150)/2,
        child: DropdownButton<String>(
          isExpanded: true,
          autofocus: false,
          value: val1,
          items: GetList().map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(child: Text(value)),
            );
          }).toList(),
          onChanged: (_) {setState(() {
            val1 = _;
            for(int i=0;i<India.length;i++){
              if(India[i].State == _){
               index1 = i;
                break;
              }
            }

          });},
        ),
      ),
      Container(
        width:  (MediaQuery.of(context).size.width - 150)/2,
        child: DropdownButton<String>(
          isExpanded: true,
          autofocus: false,
          value: val2,
          items: GetList().map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(child: Text(value)),
            );
          }).toList(),
          onChanged: (_) {setState(() {
            val2 = _;
            for(int i=0;i<India.length;i++){
              if(India[i].State == _){
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
