import 'package:datawiz_final/SettingsAndVariables/Util/maxAndmin.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group("Testing integers", (){

    group("max integer", (){

      test("Int Test 1", (){
        int result = max(10, 12);
        expect(result, 12);
      });
      test("Int Test 2", (){
        int result = max(4, 4);
        expect(result, 4);
      });
      test("Int Test 3", (){
        int result = max(-24, -56);
        expect(result, -24);
      });

    });

    group("min integer", (){

      test("Int Test 1", (){
        int result = min(10, 12);
        expect(result, 10);
      });
      test("Int Test 2", (){
        int result = min(4, 4);
        expect(result, 4);
      });
      test("Int Test 3", (){
        int result = min(-24, -56);
        expect(result, -56);
      });

    });

  });

  group("Testing double", (){

    group("max double", (){

      test("double Test 1", (){
        double result = maxd(10.4, 12.3);
        expect(result, 12.3);
      });
      test("double Test 2", (){
        double result = maxd(4.6, 4.6);
        expect(result, 4.6);
      });
      test("double Test 3", (){
        double result = maxd(-24.45, -56.32);
        expect(result, -24.45);
      });

    });

    group("min double", (){

      test("double Test 1", (){
        double result = mind(10.32, 12.66);
        expect(result, 10.32);
      });
      test("double Test 2", (){
        double result = mind(4.67, 4.67);
        expect(result, 4.67);
      });
      test("double Test 3", (){
        double result = mind(-24.32, -56.54);
        expect(result, -56.54);
      });

    });

  });

}