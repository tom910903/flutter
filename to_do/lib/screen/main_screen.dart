import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:to_do/component/title_bar.dart';
import '../component/right_drawer.dart';
import 'package:to_do/database/database_helper.dart';
import 'package:to_do/model/to_do_model.dart';
import 'package:to_do/database/to_do_bloc.dart';

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
    todoBloc.dispose();
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
                  return OutlinedButton(
                      onPressed: (){
                        _scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo_sharp),
                          Text("data")
                        ],
                      )
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
          child:
          StreamBuilder(
              stream: todoBloc.ToDos,
              builder: (BuildContext context, AsyncSnapshot<List<ToDoModel>> snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    ToDoModel item = snapshot.data![index];
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        todoBloc.deleteToDo(item.pk as int);
                      },
                      child: ListTile(
                        onTap: () {
                          // Get.toNamed("/memos/${item.pk}");
                        },
                        leading: Text(
                          item.pk.toString(),
                        ),
                        title: Text(item.todo as String),
                        subtitle: Text(item.type),
                        trailing: Checkbox(
                          onChanged: (bool? value) {
                            item.toggleComplete();
                            todoBloc.updateToDo(item);
                          },
                          value: item.complete == 1 ? true : false,
                        ),
                      ),
                    );
                  },
                )
                    : Center(
                  child: Center(
                    child: Text('아무것도 엄써 ㅇㅅㅇ!'),
                  ),
                );
              }
          ),
        ),

          // FutureBuilder(
          //   future: DBHelper().getAllToDoModels(),
          //   builder: (BuildContext context, AsyncSnapshot<List<ToDoModel>> snapshot) {
          //
          //     if(snapshot.hasData) {
          //
          //       return ListView.builder(
          //         itemCount: snapshot.data!.length,
          //         itemBuilder: (BuildContext context, int index) {
          //
          //           ToDoModel item = snapshot.data![index];
          //
          //           return Dismissible(
          //             key: UniqueKey(),
          //             onDismissed: (direction) {
          //               DBHelper().deleteToDoModel(item.pk);
          //               setState(() {});
          //             },
          //             child: Center(child: Text(item.title)),
          //           );
          //         },
          //       );
          //     }
          //     else
          //     {
          //       return Center(child: CircularProgressIndicator(),);
          //     }
          //   },
          // ),

          // ListView.separated(
          //   itemBuilder: (BuildContext context, int index) {
          //     return Text('$index',
          //       style: TextStyle(
          //           fontSize: 20
          //       ),
          //     );
          //   },
          //   separatorBuilder: (BuildContext context, int index) => const Divider(),
          //   itemCount: 20,
          // ),
          // ),
          LinearPercentIndicator(
            // width: 140.0,
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