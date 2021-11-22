import 'dart:convert';

import 'package:capstone_apps/data/models/hospital_model.dart';

HospitalResponse hospitalResponseFromJson(String str) =>
    HospitalResponse.fromJson(json.decode(str));

String hospitalResponseToJson(HospitalResponse data) =>
    json.encode(data.toJson());

class HospitalResponse {
  HospitalResponse({
    required this.status,
    required this.hospitals,
  });

  int status;
  List<HospitalModel> hospitals;

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
}
