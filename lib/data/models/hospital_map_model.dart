import 'package:capstone_apps/domain/entities/hospital_map.dart';

class HospitalMapModel {
  HospitalMapModel({
    required this.gmaps,
  });

  String gmaps;

  factory HospitalMapModel.fromJson(Map<String, dynamic> json) =>
      HospitalMapModel(
        gmaps: json["gmaps"],
      );

  Map<String, dynamic> toJson() => {
        "gmaps": gmaps,
      };

  HospitalMap toEntity() => HospitalMap(gmaps: gmaps);
}
