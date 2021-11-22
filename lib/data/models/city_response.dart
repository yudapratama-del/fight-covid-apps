import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:capstone_apps/data/models/city_model.dart';

CityResponse cityResponseFromJson(String str) =>
    CityResponse.fromJson(json.decode(str));

String cityResponseToJson(CityResponse data) => json.encode(data.toJson());

class CityResponse extends Equatable {
  CityResponse({
    required this.cities,
  });

  final List<CityModel> cities;

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        cities: List<CityModel>.from(
            json["cities"].map((x) => CityModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [cities];
}
