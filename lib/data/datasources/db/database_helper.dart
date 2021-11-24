import 'package:capstone_apps/data/models/news_table.dart';
import 'package:logger/logger.dart';
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

  static const String _TBL_BOOKMARK = "bookmark";

  Logger _logger = Logger();

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = "$path/fightcovid.db";

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_TBL_BOOKMARK (
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

  Future<int> insertNewsBookmark(NewsTable news) async {
    _logger.d("INSERT NEWS TO BOOKMARK");
    final db = await database;
    _logger.d(news.toJson());
    return await db!.insert(_TBL_BOOKMARK, news.toJson());
  }

  Future<List<Map<String, dynamic>>> getNewsBookmark() async {
    _logger.d("GET NEWS FROM BOOKMARK");
    final db = await database;
    final List<Map<String, dynamic>> result = await db!.query(_TBL_BOOKMARK);
    _logger.d(result);
    return result;
  }

  Future<Map<String, dynamic>?> getNewsBookmarkByUrl(String url) async {
    final db = await database;
    final result = await db!.query(
      _TBL_BOOKMARK,
      where: "url = ?",
      whereArgs: [url],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<int> removeNewsBookmark(NewsTable newsTable) async {
    final db = await database;
    return await db!.delete(
      _TBL_BOOKMARK,
      where: "url = ?",
      whereArgs: [newsTable.url],
    );
  }
}
