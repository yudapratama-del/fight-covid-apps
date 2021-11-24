import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:capstone_apps/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveBookmark {
  final NewsRepository repository;

  RemoveBookmark(this.repository);

  Future<Either<Failure, String>> execute(Article article) {
    return repository.removeBookmarkNews(article);
  }
}
