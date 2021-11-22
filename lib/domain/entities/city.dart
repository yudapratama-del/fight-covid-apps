import 'package:equatable/equatable.dart';

class City extends Equatable {
  City({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object> get props => [id, name];
}
