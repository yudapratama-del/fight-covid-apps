import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:capstone_apps/domain/usecases/get_bookmark.dart';
import 'package:capstone_apps/domain/usecases/get_news.dart';
import 'package:capstone_apps/domain/usecases/save_bookmark.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class NewsNotifier extends ChangeNotifier {
  static const bookmarkAddSuccessMsg = 'Added to Bookmark';
  static const bookmarkRemoveSuccessMsg = 'Removed from Bookmark';

  var _news = <Article>[];
  List<Article>? get news => _news;
  RequestState _newsState = RequestState.Empty;
  RequestState get newsState => _newsState;

  var _bookmarkNews = <Article>[];
  List<Article> get bookmarkNews => _bookmarkNews;
  RequestState _bookmarkState = RequestState.Empty;
  RequestState get bookmarkState => _bookmarkState;

  GetNews getNews;
  SaveBookmark saveBookmark;
  GetBookmark getBookmark;

  NewsNotifier({
    required this.getNews,
    required this.saveBookmark,
    required this.getBookmark,
  });

  String? _msg = "";
  String? get msg => _msg;
  Logger _logger = Logger();

  Future<void> fetchNews() async {
    _newsState = RequestState.Loading;
    notifyListeners();

    final result = await getNews.execute();

    result.fold((fail) {
      _newsState = RequestState.Error;
      _msg = fail.message;
      notifyListeners();
    }, (data) {
      _newsState = RequestState.Loaded;
      _logger.d(data.length);
      _news = data;
      notifyListeners();
    });
  }

  Future<void> fetchBookmarkNews() async {
    _bookmarkState = RequestState.Loading;
    notifyListeners();

    final result = await getBookmark.execute();
    result.fold((fail) {
      _bookmarkState = RequestState.Error;
      _msg = fail.message;
      notifyListeners();
    }, (data) {
      _bookmarkState = RequestState.Loaded;
      _bookmarkNews = data;
      notifyListeners();
    });
  }

  String _bookmarkMsg = '';
  String get bookmarkMsg => _bookmarkMsg;

  Future<void> addNewsBookmark(Article article) async {
    final result = await saveBookmark.execute(article);

    result.fold((fail) {
      _bookmarkMsg = fail.message;
      notifyListeners();
    }, (successMsg) {
      _bookmarkMsg = successMsg;
      notifyListeners();
    });
  }
}
