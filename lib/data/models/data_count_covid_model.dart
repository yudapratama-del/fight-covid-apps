import 'package:capstone_apps/domain/entities/data_count_covid_model.dart';
import 'package:equatable/equatable.dart';

class DataCountCovidModel extends Equatable {
  DataCountCovidModel({
    required this.jumlahPositif,
    required this.jumlahSembuh,
    required this.jumlahMeninggal,
  });

  final int jumlahPositif;
  final int jumlahSembuh;
  final int jumlahMeninggal;

  factory DataCountCovidModel.fromJson(Map<String, dynamic> json) =>
      DataCountCovidModel(
        jumlahPositif: json["jumlah_positif"],
        jumlahSembuh: json["jumlah_sembuh"],
        jumlahMeninggal: json["jumlah_meninggal"],
      );

  Map<String, dynamic> toJson() => {
        "jumlah_positif": jumlahPositif,
        "jumlah_sembuh": jumlahSembuh,
        "jumlah_meninggal": jumlahMeninggal,
      };

  DataCountCovid toEntity() => DataCountCovid(
        jumlahPositif: jumlahPositif,
        jumlahSembuh: jumlahSembuh,
        jumlahMeninggal: jumlahMeninggal,
      );

  @override
  List<Object> get props => [jumlahPositif, jumlahSembuh, jumlahMeninggal];
}
