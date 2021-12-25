import 'package:flutter/material.dart';

class CalculatorModel with ChangeNotifier{

  String _value = "0";
  String _unformattedValue = "0";
  String _operation = "";
  double _prevValue = 0;

  String get Value=> _value;
  String get UnformattedValue=> _unformattedValue;
  String get peration => _operation;
  double get PrevValue => _prevValue;

  setValue(String value) {
    _value = reslutFormat(value);
  }

  setUnformattedValue(String value) {
    if(value == '.' && _unformattedValue.contains('.')) return;
    if(value == '.') {
      _unformattedValue += value;
    }else {
      if (_value == "0") {
        _unformattedValue = value;
      } else {
        _unformattedValue += value;
      }
      setValue(_unformattedValue);
    }

    notifyListeners();
  }

  setOperation(String value) {
    if(value == "/" || value == "*" || value == "-" || value == "+"){
      _operation = value;
      _prevValue = double.parse(_value);
      _value = "0";
    }else if(value == "AC"){
      if(_value == "0"){
        reset();
      }else{
        init();
      }
    }else if(value == "+/-"){

    }else if(value == "%"){

    }else{
      _unformattedValue = calc();
      _value = "0";
    }
    notifyListeners();
  }
  setPrevValue(double value) {
    _prevValue = value;
    notifyListeners();
  }

  reset(){
    _value = "0";
    _unformattedValue = "0";
    notifyListeners();
  }

  init(){
    _value = "0";
    _operation = "";
    _prevValue = 0;
    _unformattedValue = "0";
    notifyListeners();
  }

  String calc(){
    String result = "0";
    if(_operation == "+"){
      result = reslutFormat((_prevValue + double.parse(_value)).toString());
    }else if (_operation == "-"){
      result = reslutFormat((_prevValue - double.parse(_value)).toString());
    }else if (_operation == "/"){
      result = reslutFormat((_prevValue / double.parse(_value)).toString());
    }else if (_operation == "*"){
      result = reslutFormat((_prevValue * double.parse(_value)).toString());
    }
    return result;
  }

  String reslutFormat(String value){
    String result = "";

    if(isInt(value)){
      result = double.parse(value).toInt().toString();
    }else{
      result = value.toString();
    }

    return result;
  }
}

bool isInt(String value) {
  if(value == null) {
    return false;
  }

  List<String> str = value.split(".");

  if(str.length == 1){
    return true;
  }

  int? parseNum = int.tryParse(str[1]);

  if(parseNum == null){
    return false;
  }

  return parseNum == 0;
}