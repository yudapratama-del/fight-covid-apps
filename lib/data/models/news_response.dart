import 'package:capstone_apps/data/models/articles_model.dart';
import 'package:equatable/equatable.dart';

class NewsResponse extends Equatable {
  NewsResponse({
    required this.articles,
  });

  final List<ArticleModel> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
      articles: List<ArticleModel>.from(
          (json["articles"] as List).map((x) => ArticleModel.fromJson(x)).where(
                (article) =>
                    article.author != null &&
                    article.urlToImage != null &&
                    article.publishedAt != null &&
                    article.content != null,
              )));

  Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [articles];
}
