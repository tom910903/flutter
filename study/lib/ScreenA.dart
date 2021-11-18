import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenA'),
          centerTitle: true,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/b');
            },
            child: Text("go to ScreenB"),
          ),
          RaisedButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/c');
            },
            child: Text("go to ScreenC"),
          ),
        ])));
  }
}
