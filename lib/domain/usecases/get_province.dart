import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/province.dart';
import 'package:capstone_apps/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetProvince {
  LocationRepository repository;

  GetProvince(this.repository);

  Future<Either<Failure, List<Province>>> execute() {
    return repository.getDataProvince();
  }
}
