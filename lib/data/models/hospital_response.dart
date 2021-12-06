import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:capstone_apps/data/models/hospital_model.dart';

HospitalResponse hospitalResponseFromJson(String str) =>
    HospitalResponse.fromJson(json.decode(str));

String hospitalResponseToJson(HospitalResponse data) =>
    json.encode(data.toJson());

class HospitalResponse extends Equatable {
  HospitalResponse({
    required this.status,
    required this.hospitals,
  });

  final int status;
  final List<HospitalModel> hospitals;

  factory HospitalResponse.fromJson(Map<String, dynamic> json) =>
      HospitalResponse(
        status: json["status"],
        hospitals: List<HospitalModel>.from(
            json["hospitals"].map((x) => HospitalModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "hospitals": List<dynamic>.from(hospitals.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [status, hospitals];
}
