// To parse this JSON data, do
//
//     final guruModel = guruModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GuruModel guruModelFromJson(String str) => GuruModel.fromJson(json.decode(str));

String guruModelToJson(GuruModel data) => json.encode(data.toJson());

class GuruModel {
  final String name;
  final String email;
  final String phone;
  final int isActive;
  final int lokasiId;
  final String sklIjazah;
  final int userId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  GuruModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.lokasiId,
    required this.sklIjazah,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory GuruModel.fromJson(Map<String, dynamic> json) => GuruModel(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    isActive: json["is_active"],
    lokasiId: json["lokasi_id"],
    sklIjazah: json["skl_ijazah"],
    userId: json["user_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "is_active": isActive,
    "lokasi_id": lokasiId,
    "skl_ijazah": sklIjazah,
    "user_id": userId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
