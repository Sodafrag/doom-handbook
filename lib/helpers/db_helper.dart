import 'package:sqflite/sqflite.dart' as sqf;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as p;

class DbHelper {
  static String pathName = "profile";
  static String settingsTable = "settings";
  static String bookmarkTable = "bookmark";
  static Future<Database> _dataBase() async {
    String _dbPath = await sqf.getDatabasesPath();
    String _path = p.join(_dbPath, pathName);
    return await sqf.openDatabase(_path, version: 1,
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE $settingsTable (id TEXT PRIMARY KEY, isLight INTEGER, isBigText INTEGER)');
      await db.execute(
          'CREATE TABLE $bookmarkTable (id TEXT PRIMARY KEY, scrollIndex REAL, section INTEGER, chapter INTEGER)');
    });
  }

  static Future<void> updateSettings(Map<String, Object> settings) async {
    var db = await _dataBase();
    db.insert(settingsTable, settings,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> updateBookmark(Map<String, Object> bookmark) async {
    var db = await _dataBase();
    db.insert(bookmarkTable, bookmark,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future getSettings() async {
    print("fetchSetting");
    var db = await _dataBase();
    return await db.query(settingsTable);
  }

  static Future getBookmark() async {
    print("fetchBookmark");
    var db = await _dataBase();
    return await db.query(bookmarkTable);
  }
}
