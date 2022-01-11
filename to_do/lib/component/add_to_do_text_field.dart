import 'package:flutter/material.dart';

import 'package:to_do/model/to_do_model.dart';
import 'package:to_do/logic/to_do_bloc.dart';

class AddToDoTextField extends StatefulWidget {

  bool isAddToDo = false;
  _AddToDoTextFieldState _addToDoTextFieldState = _AddToDoTextFieldState(false);

  @override
  _AddToDoTextFieldState createState() => _addToDoTextFieldState;

  bool getIsAddToDo() {
    return _addToDoTextFieldState.isAddToDo;
  }

  void setIsAddToDo(bool isAddToDo) {
    _addToDoTextFieldState.isAddToDo = isAddToDo;
  }
}

class _AddToDoTextFieldState extends State<AddToDoTextField> {
  final ToDoBloc _todoBloc = ToDoBloc();
  bool _isAddToDo = false;

  _AddToDoTextFieldState(this._isAddToDo);

  bool get isAddToDo{
    return _isAddToDo;
  }

  void set isAddToDo(bool isAddToDo){
    setState(() {
      _isAddToDo = isAddToDo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isAddToDo,
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
                        isAddToDo = false;

                        ToDoModel newTodo = ToDoModel(todo: '메모 내용이양', type: '했어!', complete: 1);
                        _todoBloc.addToDos(newTodo);
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
    );
  }
}