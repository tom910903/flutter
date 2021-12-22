import 'package:flutter/material.dart';

class CalculatorModel with ChangeNotifier{

  String _value = "0";
  String _operation = "";
  double _prevValue = 0;

  String get Value=> _value;
  String get peration => _operation;
  double get PrevValue => _prevValue;

  setValue(String value) {
    if(value == '.' && _value.contains('.')) return;
    if(value == '.') {
      _value += value;
    }else {
      if (_value == "0") {
        _value = value;
      } else {
        _value += value;
      }
    }
      notifyListeners();
  }
  setOperation(String value) {
    if(value == "/" || value == "*" || value == "-" || value == "+"){
      _operation = value;
      _prevValue = double.parse(_value);
    }else if(value == "AC"){
      if(_value == "0"){
        reset();
      }else{
        init();
      }
    }else if(value == "+/-"){

    }else if(value == "%"){

    }else{
      _value = calc();
    }
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

  String calc(){
    String result = "0";
    if(_operation == "+"){
      result = (_prevValue + double.parse(_value)).toString();
    }else if (_operation == "-"){
      result = (_prevValue - double.parse(_value)).toString();
    }else if (_operation == "/"){
      result = (_prevValue / double.parse(_value)).toString();
    }else if (_operation == "*"){
      result = (_prevValue * double.parse(_value)).toString();
    }
    return result;
  }
}