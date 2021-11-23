import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/domain/entities/city.dart';
import 'package:capstone_apps/domain/entities/hospital.dart';
import 'package:capstone_apps/domain/entities/province.dart';
import 'package:capstone_apps/domain/usecases/get_city.dart';
import 'package:capstone_apps/domain/usecases/get_hospital.dart';
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

  GetProvince getProvince;
  GetCity getCity;
  GetHospital getHospital;

  LocationNotifier({
    required this.getProvince,
    required this.getCity,
    required this.getHospital,
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
}
