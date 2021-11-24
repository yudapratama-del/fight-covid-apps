import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }

  static const String _tblBookmark = "bookmark";

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = "$path/fightcovid.db";

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tblBookmark (
        url TEXT PRIMARY KEY,
        author TEXT,
        title TEXT,
        description TEXT,
        urlToImage TEXT,
        publishedAt TEXT,
        content TEXT
      )
    ''');
  }
}
