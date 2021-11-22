import 'dart:convert';

import 'package:capstone_apps/common/exception.dart';
import 'package:capstone_apps/data/models/province_model.dart';
import 'package:capstone_apps/data/models/province_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

abstract class LocationRemoteDataSource {
  Future<List<ProvinceModel>> getDataProvince();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  static const BASE_URL =
      "https://rs-bed-covid-api.vercel.app/api/get-provinces";

  final http.Client client;

  LocationRemoteDataSourceImpl({required this.client});

  Logger _logger = Logger();

  @override
  Future<List<ProvinceModel>> getDataProvince() async {
    final response = await client.get(Uri.parse(BASE_URL));

    _logger.d(response.body);

    if (response.statusCode == 200) {
      return ProvinceResponse.fromJson(json.decode(response.body)).provinces;
    } else {
      throw ServerException();
    }
  }
}
