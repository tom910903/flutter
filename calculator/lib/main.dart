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
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [ResultWidget(), KeyBoardWidget()],
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          alignment: Alignment.bottomRight,
          child: Text("0", style: TextStyle(fontSize: 40, color: Colors.white,)),
        )
    );
  }
}

class KeyBoardWidget extends StatelessWidget {
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
    return Expanded(
        flex: 7,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Key(
                        text: "AC",
                        isnumber: false,
                        bgColor: const Color(0xFFBDBDBD),
                        textColor: Colors.black),
                    Key(
                        text: "+/-",
                        isnumber: false,
                        bgColor: const Color(0xFFBDBDBD),
                        textColor: Colors.black),
                    Key(
                        text: "%",
                        isnumber: false,
                        bgColor: const Color(0xFFBDBDBD),
                        textColor: Colors.black),
                    Key(text: "/", isnumber: false, bgColor: Colors.amber),
                  ],
                ),
              ),
              Expanded(
                  child:  Row(
                    children: [
                      Key(text: "7"),
                      Key(text: "8"),
                      Key(text: "9"),
                      Key(text: "*", isnumber: false, bgColor: Colors.amber),
                    ],
                  )
              ),
              Expanded(
                  child: Row(
                    children: [
                      Key(text: "4"),
                      Key(text: "5"),
                      Key(text: "6"),
                      Key(text: "-", isnumber: false, bgColor: Colors.amber),
                    ],
                  )
              ),
              Expanded(
                  child: Row(
                    children: [
                      Key(text: "1"),
                      Key(text: "2"),
                      Key(text: "3"),
                      Key(text: "+", isnumber: false, bgColor: Colors.amber),
                    ],
                  )
              ),
              Expanded(
                  child: Row(
                    children: [
                      Key(text: "0", flex: 2,),
                      Key(text: ".", isnumber: false),
                      Key(text: "=", isnumber: false),
                    ],
                  )
              )
            ],
          ),
        ));
  }
}

class Key extends StatelessWidget {
  Key(
      {required String text,
        Color bgColor = const Color(0xFF303030),
        Color textColor = Colors.white,
        bool isnumber = true,
        int flex = 1})
      : _text = text,
        _backgroundColor = bgColor,
        _textColor = textColor,
        _isNumber = isnumber,
        _flex = flex;

  final String _text;
  final Color _textColor;
  final Color _backgroundColor;
  final bool _isNumber;
  final int _flex;

  Widget build(BuildContext context) {
    return Expanded(
        flex: _flex,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: TextButton(
              onPressed: () {
                if(_isNumber){

                }else{

                }
              },
              child: Text(_text),
              style: TextButton.styleFrom(
                backgroundColor: _backgroundColor,
                primary: _textColor,
                textStyle: const TextStyle(fontSize: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        )
    );
  }
}
