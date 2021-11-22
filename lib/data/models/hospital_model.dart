import 'package:capstone_apps/domain/entities/hospital.dart';
import 'package:equatable/equatable.dart';

class HospitalModel extends Equatable {
  HospitalModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.queue,
    required this.bedAvailability,
    required this.info,
  });

  final String id;
  final String name;
  final String address;
  final String phone;
  final int queue;
  final int bedAvailability;
  final String info;

  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        queue: json["queue"],
        bedAvailability: json["bed_availability"],
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "queue": queue,
        "bed_availability": bedAvailability,
        "info": info,
      };

  Hospital toEntity() => Hospital(
        id: id,
        name: name,
        address: address,
        phone: phone,
        queue: queue,
        bedAvailability: bedAvailability,
        info: info,
      );

  @override
  List<Object> get props {
    return [
      id,
      name,
      address,
      phone,
      queue,
      bedAvailability,
      info,
    ];
  }
}
