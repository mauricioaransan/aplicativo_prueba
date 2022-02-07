import 'package:aplicativo_prueba/Usuario/usuario.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DB {
  static Database _db;

  static const String DB_NAME = "user.db";
  static const String USER_TABLA = "user";
  static const int VERSION = 1;

  static const String USER_NAME = "user_name";
  static const String USER_PASS = "user_pass";
  static const String USER_USERID = "user_id";

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: VERSION, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $USER_TABLA ("
        " $USER_NAME TEXT, "
        " $USER_PASS TEXT, "
        " PRIMARY KEY ($USER_USERID)"
        ")");
  }

  Future<int> saveData(Usuario user) async {
    var dbClient = await db;
    var res = await dbClient.insert(USER_TABLA, user.toMap());
    return res;
  }

  Future<Usuario> getLoginUser(String username, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $USER_TABLA WHERE "
        "$USER_NAME = '$username' AND "
        "$USER_PASS = '$password'");

    if (res.length > 0) {
      return Usuario.fromMap(res.first);
    }

    return null;
  }
}
