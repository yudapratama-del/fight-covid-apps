import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:capstone_apps/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class GetBookmark {
  final NewsRepository repository;

  GetBookmark(this.repository);

  Future<Either<Failure, List<Article>>> execute() {
    return repository.getBookmarkNews();
  }
}
