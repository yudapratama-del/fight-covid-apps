import 'package:equatable/equatable.dart';
import 'package:capstone_apps/domain/entities/articles.dart';

class NewsTable extends Equatable {
  NewsTable({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  factory NewsTable.fromEntity(Article article) => NewsTable(
        author: article.author,
        title: article.title,
        description: article.description,
        url: article.url,
        urlToImage: article.urlToImage,
        publishedAt: article.publishedAt,
        content: article.content,
      );

  factory NewsTable.fromMap(Map<String, dynamic> map) {
    return NewsTable(
      author: map['author'] != null ? map['author'] : null,
      title: map['title'] != null ? map['title'] : null,
      description: map['description'] != null ? map['description'] : null,
      url: map['url'] != null ? map['url'] : null,
      urlToImage: map['urlToImage'] != null ? map['urlToImage'] : null,
      publishedAt: map['publishedAt'] != null
          ? DateTime.parse(map["publishedAt"])
          : null,
      content: map['content'] != null ? map['content'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      "publishedAt": publishedAt!.toIso8601String(),
      'content': content,
    };
  }

  Article toEntity() => Article(
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
      );

  @override
  List<Object?> get props {
    return [
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}
