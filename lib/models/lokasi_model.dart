// To parse this JSON data, do
//
//     final kecamatan = kecamatanFromJson(jsonString);

import 'dart:convert';

List<LokasiModel> kecamatanFromJson(String str) => List<LokasiModel>.from(
    json.decode(str).map((x) => LokasiModel.fromJson(x)));

String kecamatanToJson(List<LokasiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LokasiModel {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  LokasiModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LokasiModel.fromJson(Map<String, dynamic> json) => LokasiModel(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
