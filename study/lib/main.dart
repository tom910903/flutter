//21
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
          centerTitle: true,
        ),
        body: Center(
          child: FlatButton(
            onPressed: () {
              flutterToast();
            },
            child: Text("Toast"),
            color: Colors.blue,
          ),
        ));
  }
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: "msg",
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      fontSize: 20,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
