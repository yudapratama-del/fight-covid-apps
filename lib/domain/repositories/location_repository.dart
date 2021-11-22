import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/province.dart';
import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Province>>> getDataProvince();
}
