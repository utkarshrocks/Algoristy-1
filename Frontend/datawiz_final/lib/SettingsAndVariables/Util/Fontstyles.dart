import 'package:flutter/material.dart';

TextStyle FontStyle(){
  return TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600,
    color: Colors.white
  );
}

TextStyle FontStyle2(){
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
  );
}

TextStyle FontStyle3(var color){
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: color,
  );
}