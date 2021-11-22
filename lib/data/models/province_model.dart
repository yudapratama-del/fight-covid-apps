import 'package:capstone_apps/domain/entities/province.dart';
import 'package:equatable/equatable.dart';

class ProvinceModel extends Equatable {
  ProvinceModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  Province toEntity() => Province(
        id: id,
        name: name,
      );

  @override
  List<Object> get props => [id, name];
}
