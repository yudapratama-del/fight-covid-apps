import 'dart:convert';

import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/data/models/data_update_covid_model.dart';
import 'package:capstone_apps/data/models/update_data_covid_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

abstract class CovidRemoteDataSource {
  Future<UpdateDataCovidModel> getDataCovid();
}

class CovidRemoteDataSourceImpl implements CovidRemoteDataSource {
  static const BASE_URL = "https://data.covid19.go.id/public/api/update.json";

  final http.Client client;

  CovidRemoteDataSourceImpl({required this.client});

  Logger _logger = Logger();

  @override
  Future<UpdateDataCovidModel> getDataCovid() async {
    final response = await client.get(Uri.parse(BASE_URL));

    if (response.statusCode == 200) {
      return DataCovidResponse.fromJson(json.decode(response.body)).update;
    } else {
      throw ServerException();
    }
  }
}
