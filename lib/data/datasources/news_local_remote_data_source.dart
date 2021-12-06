import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/data/datasources/db/database_helper.dart';
import 'package:capstone_apps/data/models/news_table.dart';

abstract class NewsLocalDataSource {
  Future<String> insertNewsBookmark(NewsTable newsTable);
  Future<List<NewsTable>> getNewsBookmark();
  Future<NewsTable?> getNewsBookmarkByUrl(String url);
  Future<String> removeNewsBookmark(NewsTable newsTable);
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

  @override
  Future<NewsTable?> getNewsBookmarkByUrl(String url) async {
    final result = await databaseHelper.getNewsBookmarkByUrl(url);

    if (result != null) {
      return NewsTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<String> removeNewsBookmark(NewsTable newsTable) async {
    try {
      await databaseHelper.removeNewsBookmark(newsTable);
      return "Removed from Bookmark";
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
