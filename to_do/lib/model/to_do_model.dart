class ToDoModel {
  int? pk;
  String? todo;
  String type;
  int? complete;

  ToDoModel({
    this.pk,
    this.todo,
    this.type = "기타",
    this.complete = 0,
  });

  bool get getCompleteAsBool { // [1]
    return (complete == 1);
  }

  void toggleComplete() {
    if (getCompleteAsBool) {
      complete = 0;
    } else {
      complete = 1;
    }
  }

  factory ToDoModel.fromJson(Map<String, dynamic> json) => new ToDoModel(
    pk: json["pk"],
    todo: json["todo"],
    type: json["type"],
    complete: json["complete"],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "todo": todo,
    "type": type,
    "complete": complete,
  };
}
