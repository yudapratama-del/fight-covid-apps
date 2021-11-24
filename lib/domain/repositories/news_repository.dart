import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<Article>>> getNews();
  Future<Either<Failure, String>> saveBookmarkNews(Article article);
  Future<Either<Failure, List<Article>>> getBookmarkNews();
}
