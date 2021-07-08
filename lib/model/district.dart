import 'dart:convert';

List<District> districtFromJson(String str,String ilceName) => List<District>.from(json.decode(str).map((x) => District.fromJson(x))).where((element) => element.ilce==ilceName).toList();

String districtToJson(List<District> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class District {
  District({
    this.il,
    this.ilce,
    this.mahalle,
  });

  String il;
  String ilce;
  String mahalle;

  factory District.fromJson(Map<String, dynamic> json) => District(
    il: json["il"],
    ilce: json["ilçe"],
    mahalle: json["Mahalle"],
  );

  Map<String, dynamic> toJson() => {
    "il": il,
    "ilçe": ilce,
    "Mahalle": mahalle,
  };
}
