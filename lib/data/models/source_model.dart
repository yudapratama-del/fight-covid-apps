import 'package:equatable/equatable.dart';

class SourceModel extends Equatable {
  SourceModel({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object?> get props => [id, name];
}
