import 'package:capstone_apps/domain/repositories/news_repository.dart';

class GetBookmarkStatus {
  final NewsRepository repository;

  GetBookmarkStatus(this.repository);

  Future<bool> execute(String url) {
    return repository.isAddedToBookmark(url);
  }
}
