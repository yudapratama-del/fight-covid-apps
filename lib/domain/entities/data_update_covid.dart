import 'package:equatable/equatable.dart';

import 'package:capstone_apps/data/models/data_count_covid_model.dart';
import 'package:capstone_apps/data/models/data_date_covid_model.dart';

class UpdateDataCovid extends Equatable {
  UpdateDataCovid({
    required this.penambahan,
    required this.total,
  });

  final PenambahanModel penambahan;
  final DataCountCovidModel total;

  factory UpdateDataCovid.fromJson(Map<String, dynamic> json) =>
      UpdateDataCovid(
        penambahan: PenambahanModel.fromJson(json["penambahan"]),
        total: DataCountCovidModel.fromJson(json["total"]),
      );

  Map<String, dynamic> toJson() => {
        "penambahan": penambahan.toJson(),
        "total": total.toJson(),
      };

  @override
  List<Object> get props => [penambahan, total];
}
