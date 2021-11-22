import 'package:equatable/equatable.dart';

import 'package:capstone_apps/data/models/data_count_covid_model.dart';
import 'package:capstone_apps/data/models/data_date_covid_model.dart';

class UpdateDataCovidModel extends Equatable {
  UpdateDataCovidModel({
    required this.penambahan,
    required this.total,
  });

  final Penambahan penambahan;
  final DataCountCovidModel total;

  factory UpdateDataCovidModel.fromJson(Map<String, dynamic> json) =>
      UpdateDataCovidModel(
        penambahan: Penambahan.fromJson(json["penambahan"]),
        total: DataCountCovidModel.fromJson(json["total"]),
      );

  Map<String, dynamic> toJson() => {
        "penambahan": penambahan.toJson(),
        "total": total.toJson(),
      };

  @override
  List<Object> get props => [penambahan, total];
}
