import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:capstone_apps/data/models/data_update_covid_model.dart';

DataCovidResponse dataCovidResponseFromJson(String str) =>
    DataCovidResponse.fromJson(json.decode(str));

String dataCovidResponseToJson(DataCovidResponse data) =>
    json.encode(data.toJson());

class DataCovidResponse extends Equatable {
  DataCovidResponse({
    required this.update,
  });

  final UpdateDataCovidModel update;

  factory DataCovidResponse.fromJson(Map<String, dynamic> json) =>
      DataCovidResponse(
        update: UpdateDataCovidModel.fromJson(json["update"]),
      );

  Map<String, dynamic> toJson() => {
        "update": update.toJson(),
      };

  @override
  List<Object> get props => [update];
}
