import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/hospital_map.dart';
import 'package:capstone_apps/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetMapHospital {
  LocationRepository repository;

  GetMapHospital(this.repository);

  Future<Either<Failure, HospitalMap>> excute(String hospitalId) {
    return repository.getMapHospital(hospitalId);
  }
}
