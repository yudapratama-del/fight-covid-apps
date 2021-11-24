import 'dart:convert';

import 'package:capstone_apps/common/api_key.dart';
import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/data/models/articles_model.dart';
import 'package:capstone_apps/data/models/news_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  static const BASE_URL =
      "https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=";

  final http.Client client;

  NewsRemoteDataSourceImpl({required this.client});

  Logger _logger = Logger();

  @override
  Future<List<ArticleModel>> getNews() async {
    final response = await client.get(Uri.parse("$BASE_URL$API_KEY"));

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body)).articles;
    } else {
      throw ServerException();
    }
  }
}
