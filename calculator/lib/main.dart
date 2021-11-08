import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());


class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "calculator",
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
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
          children: <Widget>[
            ResultWidget(),
            KeyWidget()
          ],
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("0",
        style: TextStyle(
            fontSize: 40,
            color: Colors.white
        )
    );
  }
}

class KeyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
