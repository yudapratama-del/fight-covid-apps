import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/data_update_covid.dart';
import 'package:dartz/dartz.dart';

abstract class CovidRepository {
  Future<Either<Failure, UpdateDataCovid>> getUpdateDataCovid();
}
