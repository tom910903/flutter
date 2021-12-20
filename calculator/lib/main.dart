import 'package:calculator/Model/CalculatorModel.dart';
import 'package:flutter/material.dart';
import 'package:calculator/View/keypad.dart';
import 'package:calculator/View/result.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    Provider(
      create: (_) => CalculatorModel(),
      child: CalculatorApp(),
    )
);

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "calculator",
        home: CalculatorPage()
    );
  }
}

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CalculatorModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [ResultWidget(), KeyPadWidget()],
          ),
        ),
      ),
    );
  }
}