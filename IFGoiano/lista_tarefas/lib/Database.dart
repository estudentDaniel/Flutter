// ignore_for_file: depend_on_referenced_packages
import 'taksHelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? _db;
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  Future<Database?> initDB() async {
    final databasePath = await getDatabasesPath(); //caminho do sistema op
    final path = join(databasePath, 'TaksDb.db');
    return _db = await openDatabase(path,
        version: 1, onCreate: _onCreateDb, onUpgrade: _onUpgradeDb);
  }

  Future _onCreateDb(Database db, int versao) async {
    await db.execute(TaksHelper.createScript);
  }

  Future _onUpgradeDb(Database db, int antiga, int versao) async {
    // edit
    if (antiga < versao) {
      await db.execute("DROP TABLE ${TaksHelper.tableName};");
      await _onCreateDb(db, versao);
    }
  }
}
