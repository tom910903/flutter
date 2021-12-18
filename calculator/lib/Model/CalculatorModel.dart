import 'package:flutter/cupertino.dart';

import '';
class CalculatorModel with ChangeNotifier{
  String _value = "0";
  String _operation = "";
  double _prevValue = 0;

  getValue() => _value;
  getOperation() => _operation;
  getPrevValue() => _prevValue;

  setValue(String value) => _value += value;
  setOperation(String value) => _operation = value;
  setPrevValue(double value) => _prevValue = value;
}