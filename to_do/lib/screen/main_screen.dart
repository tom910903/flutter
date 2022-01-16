import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:to_do/component/title_bar.dart';
import 'package:to_do/component/right_drawer.dart';
import 'package:to_do/screen/to_do_screen.dart';
import 'package:to_do/component/add_to_do_text_field.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late AddToDoTextField _addToDoTextField;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addToDoTextField = AddToDoTextField();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CardItem> items = [
      IconTitleCardItem(
        text: "Alarm",
        iconData: Icons.access_alarms,
      ),
      IconTitleCardItem(
        text: "Add",
        iconData: Icons.add,
      ),
      IconTitleCardItem(
        text: "Call",
        iconData: Icons.add_call,
      ),
      IconTitleCardItem(
        text: "WiFi",
        iconData: Icons.wifi,
      ),
      IconTitleCardItem(
        text: "File",
        iconData: Icons.attach_file,
      ),
      IconTitleCardItem(
        text: "Air Play",
        iconData: Icons.airplay,
      ),
    ];

    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: TitleBar(),
        endDrawer: RightDrawer(),
        endDrawerEnableOpenDragGesture: true,
        body: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            children: [
              HorizontalCardPager(
                initialPage: 0,
                onPageChanged: (page) => print("page : $page"),
                onSelectedItem: (page) => print("selected : $page"),
                items: items,
              ),
              Expanded(
                child: ToDoScreen(),
              ),
              LinearPercentIndicator(
                lineHeight: 14.0,
                percent: 0.5,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ],
          ),
        ),
        floatingActionButton: KeyboardVisibilityBuilder(builder: (context, visible){
          return Visibility(
            visible: !visible,
            child: FloatingActionButton(
              onPressed: () {
                _addToDoTextField.setIsAddToDo(true);
              },
              backgroundColor: Colors.white,
              child: const Icon(Icons.add, size: 50, color: Colors.blue,),
            ),
          );
        }),
        bottomSheet: _addToDoTextField,
      ),
    );
  }
}