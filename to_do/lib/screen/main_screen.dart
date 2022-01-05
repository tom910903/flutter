import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:to_do/component/title_bar.dart';
import 'package:to_do/component/right_drawer.dart';
import 'package:to_do/model/to_do_model.dart';
import 'package:to_do/database/to_do_bloc.dart';
import 'package:to_do/screen/to_do_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isAddToDo = false;
  final ToDoBloc todoBloc = ToDoBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        visible: !_isAddToDo,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isAddToDo = true;
            });
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, size: 50, color: Colors.blue,),
        ),
      ),
      bottomSheet: Visibility(
        visible: _isAddToDo,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isAddToDo = false;

                          ToDoModel newTodo = ToDoModel(todo: '메모 내용이양', type: '했어!', complete: 1);
                          todoBloc.addToDos(newTodo);
                        });
                      },
                      icon:Icon(Icons.arrow_circle_up,
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
                  hintText: 'Add To Do',
                  hintStyle: TextStyle(
                      fontSize: 20, color: Colors.grey),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.calendar_today)
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.folder_open)
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.auto_awesome_motion_rounded )
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.star_outline_rounded)
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.edit_rounded)
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}