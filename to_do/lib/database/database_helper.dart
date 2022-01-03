import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:to_do/model/to_do_model.dart';

final String ToDoModelTable = 'ToDoModel';
// final String ToDoModelMemoTable = 'ToDoModelMemo';

class DBHelper {
  DBHelper() : super();

  // 싱글톤 클래스
  DBHelper._();
  static final DBHelper db = DBHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database as Database;
    _database = await initDB();
    return _database as Database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'myDb.db');
    return await openDatabase(
      path, // .db 파일 경로
      version: 1,
      onCreate: (Database db, int version) async {
        // INTEGER -> int,
        // REAL -> num, int + double
        // TEXT -> String,
        // BLOB -> Uint8List,
        // sqflite는 boolean을 지원 안함 -> INTEGER, {false: 0, true: 1}로 저장
        await db.execute(
            'CREATE TABLE $ToDoModelTable (pk INTEGER PRIMARY KEY AUTOINCREMENT, todo TEXT, type TEXT, complete INTEGER)'); // [1]
        // await db.execute(
        //     'CREATE TABLE $ToDoModelMemoTable (pk INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, todoPk INTEGER, createdAt INTEGER, FOREIGN KEY(todoPk) REFERENCES $ToDoModelTable(pk) ON DELETE CASCADE ON UPDATE NO ACTION)'); // [2]
        // // 여러 테이블을 생성하고싶으면 이처럼 여러번 선언을 하던지 for 문을 사용해도 된다.
      },
    );
  }

  deleteDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'myDb.db');
    return await deleteDatabase(path); // .db 삭제
  }

  // ToDoModel
  // Create ToDoModel
  createToDo(ToDoModel toDoModel) async {
    final db = await database;
    var res = await db.insert(ToDoModelTable, toDoModel.toJson());
    return res;
  }

  // Read ToDoModel
  getToDo(int pk) async {
    final db = await database;
    var res = await db.query(ToDoModelTable, where: 'pk = ?', whereArgs: [pk]); // [3]
    return res.isNotEmpty ? ToDoModel.fromJson(res.first) : Null;
  }

  // Read All ToDoModels
  getAllToDos() async {
    final db = await database;
    var res = await db.query(ToDoModelTable);
    List<ToDoModel> list =
    res.isNotEmpty ? res.map((c) => ToDoModel.fromJson(c)).toList() : [];
    return list;
  }

  // Update ToDoModel
  updateToDo(ToDoModel toDoModel) async {
    final db = await database;
    var res = await db.update(ToDoModelTable, toDoModel.toJson(),
        where: 'pk = ?', whereArgs: [toDoModel.pk]);
    return res;
  }

  // Delete ToDoModel
  deleteToDo(int pk) async {
    final db = await database;
    db.delete(ToDoModelTable, where: 'pk = ?', whereArgs: [pk]);
  }

  // Delete All ToDoModels
  deleteAllToDos() async {
    final db = await database;
    db.rawDelete('Delete from $ToDoModelTable');
  }
  //
  // // ToDoModelMemo
  // // Create ToDoModelMemo
  // createToDoModelMemo(ToDoModelMemo ToDoModelMemo) async {
  //   final db = await database;
  //   var res = await db.insert(ToDoModelMemoTable, ToDoModelMemo.toJson());
  //   return res;
  // }
  //
  // // Read ToDoModelMemo
  // getToDoModelMemo(int pk) async {
  //   final db = await database;
  //   var res = await db.query(ToDoModelMemoTable, where: 'pk = ?', whereArgs: [pk]);
  //   return res.isNotEmpty ? ToDoModelMemo.fromJson(res.first) : Null;
  // }
  //
  // // Read All ToDoModelMemos
  // getAllToDoModelMemosByToDoModelPk(int ToDoModelPk) async {
  //   final db = await database;
  //   var res =
  //   await db.query(ToDoModelMemoTable, where: 'ToDoModelPk = ?', whereArgs: [ToDoModelPk]);
  //   List<ToDoModelMemo> list =
  //   res.isNotEmpty ? res.map((c) => ToDoModelMemo.fromJson(c)).toList() : [];
  //   return list;
  // }
  //
  // // Update ToDoModelMemo
  // updateToDoModelMemo(ToDoModelMemo ToDoModel) async {
  //   final db = await database;
  //   var res = await db.update(ToDoModelMemoTable, ToDoModel.toJson(),
  //       where: 'pk = ?', whereArgs: [ToDoModel.pk]);
  //   return res;
  // }
  //
  // // Delete ToDoModelMemo
  // deleteToDoModelMemo(int pk) async {
  //   final db = await database;
  //   db.delete(ToDoModelMemoTable, where: 'pk = ?', whereArgs: [pk]);
  // }
  //
  // // Delete All ToDoModelMemos
  // deleteAllToDoModelMemos() async {
  //   final db = await database;
  //   db.rawDelete('Delete from $ToDoModelMemoTable');
  // }
}
