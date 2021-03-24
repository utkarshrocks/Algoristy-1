import 'package:datawiz/variables/variables.dart';
import 'package:flutter/material.dart';

class LoadVeteranData extends StatefulWidget {
  @override
  _LoadVeteranDataState createState() => _LoadVeteranDataState();
}

class _LoadVeteranDataState extends State<LoadVeteranData> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Veteran Data"),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int i=StartIndex;i<min(finalLength, StartIndex + NumberTiles);i++)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        color: Colors.blue,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThisRow("Facility ID", VeteranDataList[i].facilityId),
                              ThisRow("Facility Name", VeteranDataList[i].facilityName),
                              ThisRow("Address", VeteranDataList[i].address),
                              ThisRow("City", VeteranDataList[i].city),
                              ThisRow("State", VeteranDataList[i].state),
                              ThisRow("ZIP Code", VeteranDataList[i].zIPCode),
                              ThisRow("Country Name", VeteranDataList[i].countryName),
                              ThisRow("Phone Number", VeteranDataList[i].phoneNumber),
                              ThisRow("Condition", VeteranDataList[i].condition),
                              ThisRow("Measure ID", VeteranDataList[i].measureID),
                              ThisRow("Measure Name", VeteranDataList[i].measureName),
                              ThisRow("Score", VeteranDataList[i].score),
                              ThisRow("Sample", VeteranDataList[i].sample),
                              ThisRow("FootNote", VeteranDataList[i].footnote),
                              ThisRow("Start Date", VeteranDataList[i].startDate),
                              ThisRow("End Date", VeteranDataList[i].endDate),
                              ThisRow("Location", VeteranDataList[i].location),
                            ],
                          ),
                        ),
                      ),

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              CurrentPage--;
                              if(CurrentPage < 0) CurrentPage++;
                              StartIndex = CurrentPage*NumberTiles;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 50,
                            height: 50,
                            color: Colors.green,
                            child: Center(child: Icon(Icons.arrow_circle_down)),
                          ),
                        ),
                        for(int i= max(0, CurrentPage - 2); i<min(((finalLength/NumberTiles)+1).toInt(),CurrentPage + 3);i++)
                          InkWell(
                            onTap: (){
                              setState(() {
                                CurrentPage = i;
                                StartIndex = i*NumberTiles;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 50,
                              height: 50,
                              color: Colors.green,
                              child: Center(child: Text(i.toString(),style: TextStyle(
                                fontSize: 30,
                                 color: (i == CurrentPage)?Colors.white:Colors.red
                              ),)),
                            ),
                          ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              CurrentPage++;
                              if(CurrentPage > (finalLength/NumberTiles)+1) CurrentPage--;
                              StartIndex = CurrentPage*NumberTiles;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 50,
                            height: 50,
                            color: Colors.green,
                            child: Center(child: Icon(Icons.arrow_circle_up)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget ThisRow(String text1, String text2){
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text1 + " : ",overflow: TextOverflow.ellipsis,),
        Thistext(text2),
      ],
    );
  }

  Widget Thistext(String text){
    if(text == null)
      return Text("null");
    if(text.length > 50) return Text(text.substring(0, 50),overflow: TextOverflow.ellipsis);
    return Text(text,overflow: TextOverflow.ellipsis);
  }

}
