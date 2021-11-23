import 'package:capstone_apps/data/models/hospital_detail_model.dart';
import 'package:equatable/equatable.dart';

class Data {
  Data({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.bedDetail,
  });

  final String id;
  final String name;
  final String address;
  final String phone;
  final List<BedDetail> bedDetail;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        bedDetail: List<BedDetail>.from(
            json["bedDetail"].map((x) => BedDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "bedDetail": List<dynamic>.from(bedDetail.map((x) => x.toJson())),
      };
}
