import 'dart:convert';

List<County> countyFromJson(String str,String ilName) => List<County>.from(json.decode(str).map((x) => County.fromJson(x))).where((element) => element.ilId==ilName).toList();

String countyToJson(List<County> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class County {
  County({

    required this.ilId,
    required this.name,
  });


  String ilId;
  String name;

  factory County.fromJson(Map<String, dynamic> json) => County(
    ilId: json["il_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "il_id": ilId,
    "name": name,
  };
}
