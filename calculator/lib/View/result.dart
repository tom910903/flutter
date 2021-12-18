import 'package:calculator/Model/CalculatorModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          child: Text((context.watch<CalculatorModel>().getValue()), style: TextStyle(fontSize: 40, color: Colors.white,)),
        )
    );
  }
}