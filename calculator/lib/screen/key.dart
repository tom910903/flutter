import 'package:flutter/material.dart';

class KeyWidget extends StatelessWidget {

  KeyWidget(
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
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width/4 - 5,
            height: MediaQuery.of(context).size.width/4 - 5,
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
                  borderRadius: BorderRadius.circular((MediaQuery.of(context).size.width/4 - 5)/2),
                ),
              ),
            ),
          ),
        )
    );
  }
}
