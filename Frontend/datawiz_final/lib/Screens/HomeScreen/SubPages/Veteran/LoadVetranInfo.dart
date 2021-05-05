import 'package:datawiz_final/Api/veteran/getVeteranData.dart';
import 'package:datawiz_final/Models/VeteranModels/VeteranModel.dart';
import 'package:datawiz_final/SettingsAndVariables/Routes/RouteCodes.dart';
import 'package:datawiz_final/SettingsAndVariables/Util/VeteranOutliers.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LoadVeteranInfo extends StatefulWidget {
  @override
  _LoadVeteranInfoState createState() => _LoadVeteranInfoState();
}

List<VeteranModel> paginatedDataSource = [];

OrderInfoDataSource _orderInfoDataSource = OrderInfoDataSource();
int startingIndex = 0;

class _LoadVeteranInfoState extends State<LoadVeteranInfo> {

  bool Loading = true;

  @override
  void initState() {
    GetVeteranData(context).then((value){
      getOutliers();
      setState(() {
        getData();
        Loading = false;
      });
    });
    super.initState();
  }

  void getData(){
    orderInfos.clear();
    for(int i=0;i<VeteranDataList.length;i++)
      orderInfos.add(VeteranDataList[i]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
          child: (Loading)?
      Container(
        width: ScreenWidth,
        height: ScreenHeight,
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
          :Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Veteran Data"),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, VeteranOutliersRouteCode);
                    },
                    child: Text("Outliers",style: TextStyle(color: Colors.white),),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return Column(
                    children: [
                      SizedBox(
                        height: constraint.maxHeight - 60,
                        width: constraint.maxWidth,
                        child: SfDataGrid(
                          onCellDoubleTap: (val){
                            _showDialog(context,val.rowColumnIndex.rowIndex);
                          },
                            source: _orderInfoDataSource,
                            columns: <GridColumn>[
                              GridTextColumn(mappingName: 'facilityId', headerText: "Facility Id",width: 100,),
                              GridTextColumn(mappingName: 'facilityName', headerText: 'Facility Name',width: 300),
                              GridTextColumn(mappingName: 'address', headerText: 'Address',width: 150),
                              GridTextColumn(mappingName: 'city', headerText: 'City',width: 100),
                              GridTextColumn(mappingName: 'zIPCode', headerText: 'ZIP Code',width: 100),
                              GridTextColumn(mappingName: 'countryName', headerText: 'Country Name',width: 140),
                              GridTextColumn(mappingName: 'phoneNumber', headerText: 'Phone Number',width: 130),
                              GridTextColumn(mappingName: 'condition', headerText: 'Condition',width: 180),
                              GridTextColumn(mappingName: 'measureID', headerText: 'Measure ID',width: 110),
                              GridTextColumn(mappingName: 'measureName', headerText: 'Measure Name',width: 200),
                              GridTextColumn(mappingName: 'score', headerText: 'Score',width: 100),
                              GridTextColumn(mappingName: 'sample', headerText: 'Sample',width: 100),
                              GridTextColumn(mappingName: 'footnote', headerText: 'Footnote',width: 100),
                              GridTextColumn(mappingName: 'startDate', headerText: 'Start Date',width: 110),
                              GridTextColumn(mappingName: 'endDate', headerText: 'End Date',width: 110),
                              GridTextColumn(mappingName: 'location', headerText: 'Location',width: 250),
                            ]),
                      ),
                      Container(
                        height: 60,
                        child: SfDataPagerTheme(
                          data: SfDataPagerThemeData(
                            itemColor: Colors.white,
                            selectedItemColor: Colors.grey[900],
                            itemBorderRadius: BorderRadius.circular(5),
                            backgroundColor: Colors.white,
                          ),
                          child: SfDataPager(
                            delegate: _orderInfoDataSource,
                            rowsPerPage: 10,
                            direction: Axis.horizontal,
                          ),
                        ),
                      )
                    ],
                  );
                },
              )
            ),
          )),
    );
  }
}

class OrderInfoDataSource extends DataGridSource<VeteranModel> {
  @override
  List<VeteranModel> get dataSource => paginatedDataSource;

  @override
  Object getValue(VeteranModel orderInfos, String columnName) {
    switch (columnName) {
      case 'facilityId':
        return orderInfos.facilityId;
        break;
      case 'facilityName':
        return orderInfos.facilityName;
        break;
      case 'address':
        return orderInfos.address;
        break;
      case 'city':
        return orderInfos.city;
        break;
      case 'zIPCode':
        return orderInfos.zIPCode;
        break;
      case 'countryName':
        return orderInfos.countryName;
        break;
      case 'phoneNumber':
        return orderInfos.phoneNumber;
        break;
      case 'condition':
        return orderInfos.condition;
        break;
      case 'measureID':
        return orderInfos.measureID;
        break;
      case 'measureName':
        return orderInfos.measureName;
        break;
      case 'score':
        return orderInfos.score;
        break;
      case 'sample':
        return orderInfos.sample;
        break;
      case 'footnote':
        return orderInfos.footnote;
        break;
      case 'startDate':
        return orderInfos.startDate;
        break;
      case 'endDate':
        return orderInfos.endDate;
        break;
      case 'location':
        return orderInfos.location;
        break;
      default:
        return columnName;
        break;
    }
  }

  @override
  int get rowCount => orderInfos.length;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex,
      int startRowIndex, int rowsPerPage) async {
    int endIndex = startRowIndex + rowsPerPage;
    startingIndex = startRowIndex;
    if (endIndex > orderInfos.length) {
      endIndex = orderInfos.length - 1;
    }

    paginatedDataSource = List.from(
        orderInfos.getRange(startRowIndex, endIndex).toList(growable: false));
    notifyListeners();
    return true;
  }
}

void _showDialog(BuildContext context,int index) {
  int finalIndex = index-1+startingIndex;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Facility Info"),
        content: Container(
          width: ScreenWidth-100,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText("Facility ID", VeteranDataList[finalIndex].facilityId),
                RowText("Facility Name", VeteranDataList[finalIndex].facilityName),
                RowText("Address", VeteranDataList[finalIndex].address),
                RowText("City", VeteranDataList[finalIndex].city),
                RowText("ZIP Code", VeteranDataList[finalIndex].zIPCode),
                RowText("Country Name", VeteranDataList[finalIndex].countryName),
                RowText("Phone Number", VeteranDataList[finalIndex].phoneNumber),
                RowText("Condition", VeteranDataList[finalIndex].condition),
                RowText("Measure ID", VeteranDataList[finalIndex].measureID),
                RowText("Measure Name", VeteranDataList[finalIndex].measureName),
                RowText("Score", VeteranDataList[finalIndex].score),
                RowText("Sample", VeteranDataList[finalIndex].sample),
                RowText("Footnote", VeteranDataList[finalIndex].footnote),
                RowText("Start date", VeteranDataList[finalIndex].startDate),
                RowText("End Date", VeteranDataList[finalIndex].endDate),
                RowText("Location", VeteranDataList[finalIndex].location),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          new TextButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget RowText(String text1, String text2){

  if(text1 == null)text1 = "N/A";
  if(text2 == null)text2 = "N/A";

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(text1 + ": ",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),),
      Flexible(child: SelectableText(text2,maxLines: 3,)),
    ],
  );
}

List<VeteranModel> orderInfos = [];