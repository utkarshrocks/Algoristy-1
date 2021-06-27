import 'package:datawiz_final/Models/VeteranModels/VeteranOutliersModel.dart';
import 'package:datawiz_final/SettingsAndVariables/Util/findOutliers.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group("Testing sorting", (){

    test("test1", (){
      List<VeteranOutlierModel> thisList = [];
      thisList.add(VeteranOutlierModel("test name 1", 2));
      thisList.add(VeteranOutlierModel("test name 2", 67));
      thisList.add(VeteranOutlierModel("test name 3", 34));
      thisList.add(VeteranOutlierModel("test name 4", 72));
      thisList.add(VeteranOutlierModel("test name 5", 7));

      thisList.sort((a,b){
       return a.score.compareTo(b.score);
      });

      List<VeteranOutlierModel> finalList = [];
      finalList.add(VeteranOutlierModel("test name 1", 2));
      finalList.add(VeteranOutlierModel("test name 5", 7));
      finalList.add(VeteranOutlierModel("test name 3", 34));
      finalList.add(VeteranOutlierModel("test name 2", 67));
      finalList.add(VeteranOutlierModel("test name 4", 72));

      expect(thisList.length, finalList.length);

      for(int i=0;i<thisList.length;i++){
        expect(thisList[i].facilityID, finalList[i].facilityID);
        expect(thisList[i].score, finalList[i].score);
      }

    });

  });

  group("Testing mid value", (){

    test("Test1", (){

      List thisList = [1,2,3,4,5,6,7,8,9,10];
      int result = findMID(thisList);

      expect(result, 5);

    });

    test("Test2", (){

      List thisList = [1,2,3,4,5,6,7,8,9,10,11];
      int result = findMID(thisList);

      expect(result, 5);

    });

  });

  group("Finding first Q", (){

    test("Test1", (){
      int result = findFirstQ(5);
      expect(result, 2);
    });

    test("Test2", (){
      int result = findFirstQ(6);
      expect(result, 3);
    });

  });
  
  group("finding iqr", (){

    test("test1", (){
      double result = iqr(4, 30);
      expect(result, 26);
    });

    test("test2", (){
      double result = iqr(78, 80);
      expect(result, 2);
    });

    test("test3", (){
      double result = iqr(99, 120);
      expect(result, 21);
    });

  });

  group("lowerBound",(){

    test("test1", (){
      double q1 = 10;
      double q2 = 15;
      double result = lowerbound(q1,q2);

      expect(result, 2.5);

    });

    test("test2", (){
      double q1 = 20;
      double q2 = 30;
      double result = lowerbound(q1,q2);

      expect(result, 5);

    });

  });

  group("uperBound",(){

    test("test1", (){
      double q1 = 10;
      double q2 = 15;
      double result = upperbound(q1,q2);

      expect(result, 22.5);

    });

    test("test2", (){
      double q1 = 20;
      double q2 = 30;
      double result = upperbound(q1,q2);

      expect(result, 45);

    });

  });

}