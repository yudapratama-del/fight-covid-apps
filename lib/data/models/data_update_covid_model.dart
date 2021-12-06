import 'package:capstone_apps/domain/entities/data_update_covid.dart';
import 'package:equatable/equatable.dart';

import 'package:capstone_apps/data/models/data_count_covid_model.dart';
import 'package:capstone_apps/data/models/data_date_covid_model.dart';

class UpdateDataCovidModel extends Equatable {
  UpdateDataCovidModel({
    required this.penambahan,
    required this.total,
  });

  final PenambahanModel penambahan;
  final DataCountCovidModel total;

  factory UpdateDataCovidModel.fromJson(Map<String, dynamic> json) =>
      UpdateDataCovidModel(
        penambahan: PenambahanModel.fromJson(json["penambahan"]),
        total: DataCountCovidModel.fromJson(json["total"]),
      );

  Map<String, dynamic> toJson() => {
        "penambahan": penambahan.toJson(),
        "total": total.toJson(),
      };

  UpdateDataCovid toEntity() => UpdateDataCovid(
        penambahan: penambahan,
        total: total,
      );

  @override
  List<Object> get props => [penambahan, total];
}
