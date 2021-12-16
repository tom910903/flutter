import 'package:flutter/material.dart';
import 'package:calculator/screen/keypad.dart';
import 'package:calculator/screen/result.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "calculator",
      home: CalculatorPage(),
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