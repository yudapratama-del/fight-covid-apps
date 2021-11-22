import 'package:equatable/equatable.dart';

class Province extends Equatable {
  Province({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
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
