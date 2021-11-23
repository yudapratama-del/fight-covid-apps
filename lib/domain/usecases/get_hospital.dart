import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/hospital.dart';
import 'package:capstone_apps/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetHospital {
  LocationRepository repository;

  GetHospital(this.repository);

  Future<Either<Failure, List<Hospital>>> execute(
    String provinceId,
    String cityId,
  ) {
    return repository.getDataHospital(provinceId, cityId);
  }
}
