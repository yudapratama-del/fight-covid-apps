import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/data/datasources/db/database_helper.dart';
import 'package:capstone_apps/data/models/news_table.dart';

abstract class NewsLocalDataSource {
  Future<String> insertNewsBookmark(NewsTable newsTable);
  Future<List<NewsTable>> getNewsBookmark();
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  NewsLocalDataSourceImpl({required this.databaseHelper});

  final DatabaseHelper databaseHelper;

  @override
  Future<String> insertNewsBookmark(NewsTable newsTable) async {
    try {
      await databaseHelper.insertNewsBookmark(newsTable);
      return "Added to Bookmark";
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<NewsTable>> getNewsBookmark() async {
    final result = await databaseHelper.getNewsBookmark();
    return result.map((e) => NewsTable.fromMap(e)).toList();
  }
}
