import 'package:capstone_apps/data/models/hospital_detail_model.dart';
import 'package:equatable/equatable.dart';

class HospitalDetail extends Equatable {
  HospitalDetail({
    required this.status,
    required this.data,
  });

  final int status;
  final Data data;

  factory HospitalDetail.fromJson(Map<String, dynamic> json) =>
      HospitalDetail(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };

  @override
  List<Object> get props => [status, data];
}
