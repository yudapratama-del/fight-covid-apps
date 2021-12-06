import 'package:capstone_apps/domain/entities/city.dart';
import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  CityModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  City toEntity() => City(
        id: id,
        name: name,
      );

  @override
  List<Object> get props => [id, name];
}
