import 'dart:async';

import 'database_helper.dart';
import 'package:to_do/model/to_do_model.dart';

class ToDoBloc {
  ToDoBloc() {
    getToDos();
  }

  final _ToDosController = StreamController<List<ToDoModel>>.broadcast(); // [1]

  get ToDos => _ToDosController.stream;

  dispose() {
    _ToDosController.close();
  }

  getToDos() async {
    _ToDosController.sink.add(await DBHelper().getAllToDos());
  }

  addToDos(ToDoModel ToDoModel) async {
    await DBHelper().createToDo(ToDoModel);
    getToDos();
  }

  deleteToDo(int pk) async {
    await DBHelper().deleteToDo(pk);
    getToDos();
  }

  deleteAll() async {
    await DBHelper().deleteAllToDos();
    getToDos();
  }

  updateToDo(ToDoModel toDoModel) async {
    await DBHelper().updateToDo(toDoModel);
    getToDos();
  }
}
