import 'package:capstone_apps/domain/entities/hospital_detail.dart';

class HospitalDetailModel {
  HospitalDetailModel({
    required this.status,
    required this.data,
  });

  final int status;
  final DataModel data;

  factory HospitalDetailModel.fromJson(Map<String, dynamic> json) =>
      HospitalDetailModel(
        status: json["status"],
        data: DataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class DataModel {
  DataModel({
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

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
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

  Data toEntity() => Data(
        id: id,
        name: name,
        address: address,
        phone: phone,
        bedDetail: bedDetail,
      );
}

class BedDetail {
  BedDetail({
    required this.time,
    required this.stats,
  });

  final String time;
  final Stats stats;

  factory BedDetail.fromJson(Map<String, dynamic> json) => BedDetail(
        time: json["time"],
        stats: Stats.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "stats": stats.toJson(),
      };
}

class Stats {
  Stats({
    required this.title,
    required this.bedAvailable,
    required this.bedEmpty,
    required this.queue,
  });

  final String title;
  final int bedAvailable;
  final int bedEmpty;
  final int queue;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        title: json["title"],
        bedAvailable: json["bed_available"],
        bedEmpty: json["bed_empty"],
        queue: json["queue"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "bed_available": bedAvailable,
        "bed_empty": bedEmpty,
        "queue": queue,
      };
}