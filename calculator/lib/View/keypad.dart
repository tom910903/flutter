import 'package:flutter/material.dart';
import 'key.dart';

class KeyPadWidget extends StatelessWidget {
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
    return SizedBox(
      width: double.infinity,
        height: (MediaQuery.of(context).size.width/4-5)*5,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    KeyWidget(
                        text: "AC",
                        isnumber: false,
                        bgColor: const Color(0xFFBDBDBD),
                        textColor: Colors.black),
                    KeyWidget(
                        text: "+/-",
                        isnumber: false,
                        bgColor: const Color(0xFFBDBDBD),
                        textColor: Colors.black),
                    KeyWidget(
                        text: "%",
                        isnumber: false,
                        bgColor: const Color(0xFFBDBDBD),
                        textColor: Colors.black),
                    KeyWidget(text: "/", isnumber: false, bgColor: Colors.amber),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                    children: [
                      KeyWidget(text: "7"),
                      KeyWidget(text: "8"),
                      KeyWidget(text: "9"),
                      KeyWidget(text: "*", isnumber: false, bgColor: Colors.amber),
                    ],
                  )
              ),
              Expanded(
                  child: Row(
                    children: [
                      KeyWidget(text: "4"),
                      KeyWidget(text: "5"),
                      KeyWidget(text: "6"),
                      KeyWidget(text: "-", isnumber: false, bgColor: Colors.amber),
                    ],
                  )
              ),
              Expanded(
                  child: Row(
                    children: [
                      KeyWidget(text: "1"),
                      KeyWidget(text: "2"),
                      KeyWidget(text: "3"),
                      KeyWidget(text: "+", isnumber: false, bgColor: Colors.amber),
                    ],
                  )
              ),
              Expanded(
                  child: Row(
                    children: [
                      KeyWidget(text: "0", flex: 2,),
                      KeyWidget(text: ".",),
                      KeyWidget(text: "=", isnumber: false),
                    ],
                  )
              )
            ],
          ),
        ));
  }
}
