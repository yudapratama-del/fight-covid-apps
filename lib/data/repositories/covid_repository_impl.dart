import 'dart:io';

import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/data/datasources/covid_remote_data_source.dart';
import 'package:capstone_apps/domain/entities/data_update_covid.dart';
import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/repositories/covid_repository.dart';
import 'package:dartz/dartz.dart';

class CovidRepositoryImpl implements CovidRepository {
  CovidRemoteDataSource covidRemoteDataSource;

  CovidRepositoryImpl({required this.covidRemoteDataSource});

  @override
  Future<Either<Failure, UpdateDataCovid>> getUpdateDataCovid() async {
    try {
      final result = await covidRemoteDataSource.getDataCovid();

      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConncetionFailure('Failed to connect to the network'));
    }
  }
}
