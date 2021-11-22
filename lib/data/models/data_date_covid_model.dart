import 'package:capstone_apps/domain/entities/data_date_covid_model.dart';
import 'package:equatable/equatable.dart';

class PenambahanModel extends Equatable {
  PenambahanModel({
    required this.tanggal,
  });

  final DateTime tanggal;

  factory PenambahanModel.fromJson(Map<String, dynamic> json) =>
      PenambahanModel(
        tanggal: DateTime.parse(json["tanggal"]),
      );

  Map<String, dynamic> toJson() => {
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
      };

  Penambahan toEntity() => Penambahan(
        tanggal: tanggal,
      );

  @override
  List<Object> get props => [tanggal];
}
