import 'package:lista_tarefas/database.dart';
import 'package:sqflite/sqlite_api.dart';

import 'tarefa.dart';

class TaksHelper {
  //para nao fazer merda os nome da coluna tem que ser igual a da classa tarefa
  static const String tableName = "tasks";
  static const String idColumn = "id";
  static const String textColumn = "text";
  static const String imageColumn = "image";
  static String get createScript {
    return "CREATE TABLE ${tableName}( " +
        "$idColumn INTEGER PRIMARY KEY AUTOINCREMENT ," +
        "$textColumn TEXT NOT NULL," +
        "$imageColumn TEXT NULL)";
  }

  //post
  Future<Task?> save(Task task) async {
    Database? db = await DatabaseHelper().db;
    if (db != null) {
      task.id = await db.insert(tableName, task.toMap());
      return task;
    }
    return null;
  }

  Future<List<Task>> getAll() async {
    Database? db = await DatabaseHelper().db;
    List<Task> tasks = List.empty(growable: true);
    if (db != null) {
      List<Map> dadosTask = await db.query(tableName);
      for (Map task in dadosTask) {
        tasks.add(Task.fromMap(task));
      }
    }
    return tasks;
  }

  //put
  Future<int?> edit(Task task) async {
    Database? db = await DatabaseHelper().db;
    if (db != null) {
      return await db.update(tableName, task.toMap(),
          where: "$idColumn = ?", whereArgs: [task.id]);
    }
  }

  //delete
  Future<int?> delete(Task task) async {
    Database? db = await DatabaseHelper().db;
    if (db != null) {
      return await db
          .delete(tableName, where: "$idColumn = ?", whereArgs: [task.id]);
    }
  }
}
