import 'dart:ffi';

import 'package:flutter/material.dart';

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
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          children: [ResultWidget(), KeyWidget()],
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text("0", style: TextStyle(fontSize: 40, color: Colors.white)));
  }
}

class KeyWidget extends StatelessWidget {
  List<String> keys = [
    "AC",
    "+/-",
    "%",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "="
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Key(
                text: "AC",
                isnumber: false,
                bgColor: Color(0xFFBDBDBD),
                textColor: Colors.black),
            Key(
                text: "+/-",
                isnumber: false,
                bgColor: Color(0xFFBDBDBD),
                textColor: Colors.black),
            Key(
                text: "%",
                isnumber: false,
                bgColor: Color(0xFFBDBDBD),
                textColor: Colors.black),
            Key(text: "/", isnumber: false, bgColor: Colors.amber),
          ],
        ),
        Row(
          children: [
            Key(text: "7"),
            Key(text: "8"),
            Key(text: "9"),
            Key(text: "*", isnumber: false, bgColor: Colors.amber),
          ],
        ),
        Row(
          children: [
            Key(text: "4"),
            Key(text: "5"),
            Key(text: "6"),
            Key(text: "-", isnumber: false, bgColor: Colors.amber),
          ],
        ),
        Row(
          children: [
            Key(text: "1"),
            Key(text: "2"),
            Key(text: "3"),
            Key(text: "+", isnumber: false, bgColor: Colors.amber),
          ],
        ),
        Row(
          children: [
            Key(text: "0"),
            Key(text: ".", isnumber: false),
            Key(text: "=", isnumber: false),
          ],
        )
      ],
    ));
  }
}

class Key extends StatelessWidget {
  Key(
      {required String text,
      Color bgColor = const Color(0xFF303030),
      Color textColor = Colors.white,
      bool isnumber = true})
      : _text = text,
        _backgroundColor = bgColor,
        _textColor = textColor,
        _isNumber = isnumber;

  String _text;
  Color _textColor;
  Color _backgroundColor;
  bool _isNumber;

  Widget build(BuildContext context) {
    return new TextButton(
        onPressed: () {},
        child: Text(_text),
        style: TextButton.styleFrom(
            backgroundColor: _backgroundColor,
            primary: _textColor,
            textStyle: TextStyle(fontSize: 40)));
  }
}
