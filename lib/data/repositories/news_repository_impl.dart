import 'dart:io';

import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/data/datasources/news_local_remote_data_source.dart';
import 'package:capstone_apps/data/datasources/news_remote_data_source.dart';
import 'package:capstone_apps/data/models/news_table.dart';
import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource;
  NewsLocalDataSource newsLocalDataSource;

  NewsRepositoryImpl(
      {required this.newsRemoteDataSource, required this.newsLocalDataSource});

  @override
  Future<Either<Failure, List<Article>>> getNews() async {
    try {
      final result = await newsRemoteDataSource.getNews();

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConncetionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveBookmarkNews(Article article) async {
    try {
      final result = await newsLocalDataSource
          .insertNewsBookmark(NewsTable.fromEntity(article));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getBookmarkNews() async {
    final result = await newsLocalDataSource.getNewsBookmark();
    return Right(result.map((e) => e.toEntity()).toList());
  }
}
