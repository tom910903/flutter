import 'package:flutter/material.dart';

class CalculatorModel with ChangeNotifier{
  String _value = "0";
  String _operation = "";
  double _prevValue = 0;

  String get Value=> _value;
  String get peration => _operation;
  double get PrevValue => _prevValue;

  setValue(String value) {
    _value += value;
    notifyListeners();
  }
  setOperation(String value) {
    _operation = value;
    notifyListeners();
  }
  setPrevValue(double value) {
    _prevValue = value;
    notifyListeners();
  }

  reset(){
    _value = "0";
    notifyListeners();
  }

  init(){
    _value = "0";
    _operation = "";
    _prevValue = 0;
    notifyListeners();
  }
}