class HospitalMap {
  HospitalMap({
    required this.gmaps,
  });

  String gmaps;

  factory HospitalMap.fromJson(Map<String, dynamic> json) => HospitalMap(
        gmaps: json["gmaps"],
      );

  Map<String, dynamic> toJson() => {
        "gmaps": gmaps,
      };
}
