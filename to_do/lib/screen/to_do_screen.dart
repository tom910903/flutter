import 'package:flutter/material.dart';
import 'package:to_do/logic/to_do_bloc.dart';
import 'package:to_do/model/to_do_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
              return Slidable(
                key: UniqueKey(),
                startActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {  },
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.share,
                      label: 'Share',
                    ),
                    SlidableAction(
                      onPressed: (BuildContext context) {  },
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.save,
                      label: 'Save',
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {  },
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.archive,
                      label: 'Archive',
                    ),
                    SlidableAction(
                      onPressed: (BuildContext context) { todoBloc.deleteToDo(item.pk as int); },
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
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
