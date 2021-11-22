import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/domain/entities/province.dart';
import 'package:capstone_apps/domain/usecases/get_province.dart';
import 'package:flutter/material.dart';

class LocationNotifier extends ChangeNotifier {
  var _province = <Province>[];

  List<Province> get province => _province;

  RequestState _provinceState = RequestState.Empty;
  RequestState get provinceState => _provinceState;

  GetProvince getProvince;

  LocationNotifier({required this.getProvince});

  String? _msg;
  String? get msg => _msg;

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
}
