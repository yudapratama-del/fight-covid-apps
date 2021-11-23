import 'dart:io';

import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/data/datasources/news_remote_data_source.dart';
import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

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
}
