import 'package:calculator/Model/CalculatorModel.dart';
import 'package:flutter/material.dart';
import 'package:calculator/View/keypad.dart';
import 'package:calculator/View/result.dart';
import 'package:provider/provider.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculatorModel(),
      // builder: (_)=> CalculatorModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "calculator",
        home: CalculatorPage(),
      ),
    );
  }
}

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [ResultWidget(), KeyPadWidget()],
        ),
      ),
    );
  }
}