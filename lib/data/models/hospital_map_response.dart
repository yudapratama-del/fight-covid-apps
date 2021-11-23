import 'package:capstone_apps/data/models/hospital_map_model.dart';

class HospitalMapResponse {
  HospitalMapResponse({
    required this.data,
  });

  HospitalMapModel data;

  factory HospitalMapResponse.fromJson(Map<String, dynamic> json) =>
      HospitalMapResponse(
        data: HospitalMapModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}
