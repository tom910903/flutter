import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          child: Text("0", style: TextStyle(fontSize: 40, color: Colors.white,)),
        )
    );
  }
}