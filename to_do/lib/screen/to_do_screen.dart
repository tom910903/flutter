import 'package:flutter/material.dart';
import 'package:to_do/database/to_do_bloc.dart';
import 'package:to_do/model/to_do_model.dart';

class ToDoScreen extends StatelessWidget {

  final ToDoBloc todoBloc = ToDoBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
                  },
                  leading: Checkbox(
                    onChanged: (bool? value) {
                      item.toggleComplete();
                      todoBloc.updateToDo(item);
                    },
                    value: item.complete == 1 ? true : false,
                  ),
                  title: Text(item.todo as String),
                  subtitle: Text(item.type),
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
    );
  }
}
