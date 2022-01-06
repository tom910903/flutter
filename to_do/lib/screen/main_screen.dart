import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:to_do/component/title_bar.dart';
import 'package:to_do/component/right_drawer.dart';
import 'package:to_do/screen/to_do_screen.dart';
import 'package:to_do/component/add_to_do_text_field.dart';

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
    return Scaffold(
      appBar: TitleBar(),
      endDrawer: RightDrawer(),
      endDrawerEnableOpenDragGesture: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView(
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.8,
                    children: List.generate(4, (index) {
                      return GestureDetector(
                        onTap: (){
                          // _scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo_sharp),
                                Text("data")
                              ],
                            )
                        ),
                      );
                    }),
                  )
                  // Text("page2",),
                  // Text("page3",),
                ],
              ),
            ),
            Expanded(
              flex: 6,
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
      floatingActionButton: Visibility(
        visible: !_addToDoTextField.getIsAddToDo(),
        child: FloatingActionButton(
          onPressed: () {
              _addToDoTextField.setIsAddToDo(true);
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, size: 50, color: Colors.blue,),
        ),
      ),
      bottomSheet: _addToDoTextField,
    );
  }
}