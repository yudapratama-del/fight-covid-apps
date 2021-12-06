import 'package:capstone_apps/common/failure.dart';
import 'package:capstone_apps/domain/entities/city.dart';
import 'package:capstone_apps/domain/entities/hospital.dart';
import 'package:capstone_apps/domain/entities/hospital_detail.dart';
import 'package:capstone_apps/domain/entities/hospital_map.dart';
import 'package:capstone_apps/domain/entities/province.dart';
import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Province>>> getDataProvince();
  Future<Either<Failure, List<City>>> getDataCity(String provinceId);
  Future<Either<Failure, List<Hospital>>> getDataHospital(
    String provinceId,
    String cityId,
  );
  Future<Either<Failure, Data>> getDetailHospital(String hospitalId);
  Future<Either<Failure, HospitalMap>> getMapHospital(String hospitalId);
}
