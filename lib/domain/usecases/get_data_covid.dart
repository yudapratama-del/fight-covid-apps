import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/data_update_covid.dart';
import 'package:capstone_apps/domain/repositories/covid_repository.dart';
import 'package:dartz/dartz.dart';

class GetDataCovid {
  CovidRepository repository;

  GetDataCovid(this.repository);

  Future<Either<Failure, UpdateDataCovid>> execute() {
    return repository.getUpdateDataCovid();
  }
}
