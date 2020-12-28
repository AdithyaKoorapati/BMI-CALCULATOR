import 'dart:math';
import 'Input_Page.dart';
import 'Constaints.dart';




class Calculation
{
  Calculation({this.height,this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculateBMI(){
    _bmi =weight/pow(height /100, 2);
    return _bmi.toStringAsFixed(1) ;
  }
  String getResults(){
    if(_bmi>=25){
      return"over weight";
    }
    else if(_bmi>18.5){
      return "Normal";
    }
    else {
      return "Under weight";
    }
  }
  String getInterpretation(){
    if(_bmi>=25){
      return"Perform some body exercises";
    }
    else if(_bmi>18.5){
      return "You are Good";
    }
    else {
      return "Hey! Eat some food ";
    }
  }
}