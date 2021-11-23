import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/hospital_detail.dart';
import 'package:capstone_apps/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetDetailHospital {
  LocationRepository repository;

  GetDetailHospital(this.repository);

  Future<Either<Failure, HospitalDetail>> execute(String hospitalId) {
    return repository.getDetailHospital(hospitalId);
  }
}
