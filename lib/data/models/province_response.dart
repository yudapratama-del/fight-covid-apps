import 'dart:convert';

import 'package:capstone_apps/data/models/province_model.dart';

ProvinceResponse provinceResponseFromJson(String str) =>
    ProvinceResponse.fromJson(json.decode(str));

String provinceResponseToJson(ProvinceResponse data) =>
    json.encode(data.toJson());

class ProvinceResponse {
  ProvinceResponse({
    required this.provinces,
  });

  List<ProvinceModel> provinces;

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      ProvinceResponse(
        provinces: List<ProvinceModel>.from(
            json["provinces"].map((x) => ProvinceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "provinces": List<dynamic>.from(provinces.map((x) => x.toJson())),
      };
}
