import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:capstone_apps/domain/usecases/get_news.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class NewsNotifier extends ChangeNotifier {
  var _news = <Article>[];
  List<Article>? get news => _news;

  RequestState _newsState = RequestState.Empty;
  RequestState get newsState => _newsState;

  GetNews getNews;

  NewsNotifier({required this.getNews});

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
}
