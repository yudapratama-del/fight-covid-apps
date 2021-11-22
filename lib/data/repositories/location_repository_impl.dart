import 'dart:io';

import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/data/datasources/location_remote_data_source.dart';
import 'package:capstone_apps/domain/entities/province.dart';
import 'package:capstone_apps/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class ProvinceRepositoryImpl implements LocationRepository {
  LocationRemoteDataSource locationRemoteDataSource;

  ProvinceRepositoryImpl({required this.locationRemoteDataSource});

  @override
  Future<Either<Failure, List<Province>>> getDataProvince() async {
    try {
      final result = await locationRemoteDataSource.getDataProvince();

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConncetionFailure('Failed to connect to the network'));
    }
  }
}
