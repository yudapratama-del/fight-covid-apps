import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/city.dart';
import 'package:capstone_apps/domain/repositories/location_repository.dart';
import 'package:dartz/dartz.dart';

class GetProvince {
  LocationRepository repository;

  GetProvince(this.repository);

  Future<Either<Failure, List<City>>> execute(String provinceId) {
    return repository.getDataCity(provinceId);
  }
}
