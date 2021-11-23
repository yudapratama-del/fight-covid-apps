import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/domain/entities/data_update_covid.dart';
import 'package:capstone_apps/domain/usecases/get_data_covid.dart';
import 'package:flutter/widgets.dart';

class CovidNotifier extends ChangeNotifier {
  UpdateDataCovid? _updateDataCovid;

  UpdateDataCovid? get updateDataCovid => _updateDataCovid;

  RequestState _updateDataCovidState = RequestState.Empty;
  RequestState get updateDataCovidState => _updateDataCovidState;

  GetDataCovid getDataCovid;

  CovidNotifier({required this.getDataCovid});

  String? _msg = "";
  String? get msg => _msg;

  Future<void> fetchUpdateDataCovid() async {
    _updateDataCovidState = RequestState.Loading;
    notifyListeners();

    final result = await getDataCovid.execute();

    result.fold((fail) {
      _updateDataCovidState = RequestState.Error;
      _msg = fail.message;
      notifyListeners();
    }, (data) {
      _updateDataCovidState = RequestState.Loaded;
      _updateDataCovid = data;
      notifyListeners();
    });
  }
}
