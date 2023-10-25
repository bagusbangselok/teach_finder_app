// To parse this JSON data, do
//
//     final kecamatan = kecamatanFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Kecamatan> kecamatanFromJson(String str) => List<Kecamatan>.from(json.decode(str).map((x) => Kecamatan.fromJson(x)));

String kecamatanToJson(List<Kecamatan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kecamatan {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Kecamatan({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
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
