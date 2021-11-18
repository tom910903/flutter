import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenC'),
          centerTitle: true,
        ),
        body: Center(
            child: Text(
          'ScreenB',
          style: TextStyle(fontSize: 24),
        )));
  }
}
