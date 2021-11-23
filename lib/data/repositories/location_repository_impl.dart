import 'dart:io';

import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/data/datasources/location_remote_data_source.dart';
import 'package:capstone_apps/domain/entities/city.dart';
import 'package:capstone_apps/domain/entities/hospital.dart';
import 'package:capstone_apps/domain/entities/hospital_detail.dart';
import 'package:capstone_apps/domain/entities/province.dart';
import 'package:capstone_apps/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class LocationRepositoryImpl implements LocationRepository {
  LocationRemoteDataSource locationRemoteDataSource;

  LocationRepositoryImpl({required this.locationRemoteDataSource});

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

  @override
  Future<Either<Failure, List<City>>> getDataCity(String provinceId) async {
    try {
      final result = await locationRemoteDataSource.getDataCity(provinceId);

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConncetionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Hospital>>> getDataHospital(
    String provinceId,
    String cityId,
  ) async {
    try {
      final result =
          await locationRemoteDataSource.getDataHospital(provinceId, cityId);

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConncetionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Data>> getDetailHospital(
    String hospitalId,
  ) async {
    try {
      final result =
          await locationRemoteDataSource.getDetailHospital(hospitalId);

      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConncetionFailure('Failed to connect to the network'));
    }
  }
}
