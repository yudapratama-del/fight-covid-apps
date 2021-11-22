import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:capstone_apps/data/models/profince_model.dart';

ProvinceModel provinceModelFromJson(String str) =>
    ProvinceModel.fromJson(json.decode(str));

String provinceModelToJson(ProvinceModel data) => json.encode(data.toJson());

class ProvinceModel extends Equatable {
  ProvinceModel({
    required this.provinces,
  });

  final List<Province> provinces;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        provinces: List<Province>.from(
            json["provinces"].map((x) => Province.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "provinces": List<dynamic>.from(provinces.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [provinces];
}
