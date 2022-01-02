import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TitleBar extends StatefulWidget implements PreferredSizeWidget{
  TitleBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize;

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {

  bool _isSearch = false;
  Widget _title = Text("");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = getDateButton(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _title,
      actions: [
        Visibility(
          visible: !_isSearch,
          child: IconButton(
              onPressed: () {
                setState(() {
                  _isSearch = true;
                  _title = getSearchField(context);

                });
              },
              icon: Icon(Icons.search)),
        )
      ],
    );
  }

  Widget getDateButton(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child:
        Text(DateFormat('E MMM dd yyyy').format(DateTime.now()).toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        )
    );
  }

  Widget getSearchField(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isSearch = false;
                _title = getDateButton(context);
              });
            },
            icon:Icon(Icons.close_rounded,
              color: Colors.grey,
            )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(35.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.all(
            Radius.circular(35.0),
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: 'search...',
        hintStyle: TextStyle(
            fontSize: 20, color: Colors.grey),
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}