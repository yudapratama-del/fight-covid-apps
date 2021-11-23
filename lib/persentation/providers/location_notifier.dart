import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/domain/entities/city.dart';
import 'package:capstone_apps/domain/entities/hospital.dart';
import 'package:capstone_apps/domain/entities/hospital_detail.dart';
import 'package:capstone_apps/domain/entities/hospital_map.dart';
import 'package:capstone_apps/domain/entities/province.dart';
import 'package:capstone_apps/domain/usecases/get_city.dart';
import 'package:capstone_apps/domain/usecases/get_hospital.dart';
import 'package:capstone_apps/domain/usecases/get_hospital_id.dart';
import 'package:capstone_apps/domain/usecases/get_map_hospital.dart';
import 'package:capstone_apps/domain/usecases/get_province.dart';
import 'package:flutter/material.dart';

class LocationNotifier extends ChangeNotifier {
  var _province = <Province>[];
  List<Province> get province => _province;
  RequestState _provinceState = RequestState.Empty;
  RequestState get provinceState => _provinceState;

  var _city = <City>[];
  List<City> get city => _city;
  RequestState _cityState = RequestState.Empty;
  RequestState get cityState => _cityState;

  var _hospital = <Hospital>[];
  List<Hospital> get hospital => _hospital;
  RequestState _hospitalState = RequestState.Empty;
  RequestState get hospitalState => _hospitalState;

  late Data _hospitalDetail;
  Data get hospitalDetail => _hospitalDetail;
  RequestState _hospitalDetailState = RequestState.Empty;
  RequestState get hospitalDetailState => _hospitalDetailState;

  late HospitalMap _hospitalMap;
  HospitalMap get hospitalMap => _hospitalMap;
  RequestState _hospitalMapState = RequestState.Empty;
  RequestState get hospitalMapState => _hospitalMapState;

  GetProvince getProvince;
  GetCity getCity;
  GetHospital getHospital;
  GetDetailHospital getDetailHospital;
  GetMapHospital getMapHospital;

  LocationNotifier({
    required this.getProvince,
    required this.getCity,
    required this.getHospital,
    required this.getDetailHospital,
    required this.getMapHospital,
  });

  String _msg = "";
  String get msg => _msg;

  Future<void> fetchDataProvince() async {
    _provinceState = RequestState.Loading;
    notifyListeners();

    final result = await getProvince.execute();

    result.fold((fail) {
      _provinceState = RequestState.Error;
      _msg = fail.message;
      notifyListeners();
    }, (data) {
      _provinceState = RequestState.Loaded;
      _province = data;
      notifyListeners();
    });
  }

  Future<void> fetchDataCity(String provinceId) async {
    _cityState = RequestState.Loading;
    notifyListeners();

    final result = await getCity.execute(provinceId);

    result.fold((fail) {
      _cityState = RequestState.Error;
      _msg = fail.message;
      notifyListeners();
    }, (data) {
      _cityState = RequestState.Loaded;
      _city = data;
      notifyListeners();
    });
  }

  Future<void> fetchDataHospital(String provinceId, String cityId) async {
    _hospitalState = RequestState.Loading;
    notifyListeners();

    final result = await getHospital.execute(provinceId, cityId);

    result.fold((fail) {
      _hospitalState = RequestState.Error;
      _msg = fail.message;
      notifyListeners();
    }, (data) {
      _hospitalState = RequestState.Loaded;
      _hospital = data;
      notifyListeners();
    });
  }

  Future<void> fetchDetailHospital(String hospitalId) async {
    _hospitalDetailState = RequestState.Loading;
    notifyListeners();

    final result = await getDetailHospital.execute(hospitalId);
    final mapResult = await getMapHospital.excute(hospitalId);

    result.fold((fail) {
      _hospitalDetailState = RequestState.Error;
      _msg = fail.message;
      notifyListeners();
    }, (data) {
      _hospitalMapState = RequestState.Loading;
      _hospitalDetail = data;
      notifyListeners();

      mapResult.fold((fail) {
        _hospitalMapState = RequestState.Error;
        _msg = fail.message;
        notifyListeners();
      }, (maps) {
        _hospitalMapState = RequestState.Loaded;
        _hospitalMap = maps;
        notifyListeners();
      });

      _hospitalDetailState = RequestState.Loaded;
      notifyListeners();
    });
  }
}
