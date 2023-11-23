// To parse this JSON data, do
//
//     final jadwalModel = jadwalModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

JadwalModel jadwalModelFromJson(String str) => JadwalModel.fromJson(json.decode(str));

String jadwalModelToJson(JadwalModel data) => json.encode(data.toJson());

class JadwalModel {
  final int id;
  final String name;
  final String guruId;
  final String hariId;
  final String jenjangId;
  final String waktuMulai;
  final String waktuAkhir;
  final String harga;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Guru guru;
  final Hari hari;
  final Hari jenjang;

  JadwalModel({
    required this.id,
    required this.name,
    required this.guruId,
    required this.hariId,
    required this.jenjangId,
    required this.waktuMulai,
    required this.waktuAkhir,
    required this.harga,
    required this.createdAt,
    required this.updatedAt,
    required this.guru,
    required this.hari,
    required this.jenjang,
  });

  factory JadwalModel.fromJson(Map<String, dynamic> json) => JadwalModel(
    id: json["id"],
    name: json["name"],
    guruId: json["guru_id"],
    hariId: json["hari_id"],
    jenjangId: json["jenjang_id"],
    waktuMulai: json["waktu_mulai"],
    waktuAkhir: json["waktu_akhir"],
    harga: json["harga"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    guru: Guru.fromJson(json["guru"]),
    hari: Hari.fromJson(json["hari"]),
    jenjang: Hari.fromJson(json["jenjang"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guru_id": guruId,
    "hari_id": hariId,
    "jenjang_id": jenjangId,
    "waktu_mulai": waktuMulai,
    "waktu_akhir": waktuAkhir,
    "harga": harga,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "guru": guru.toJson(),
    "hari": hari.toJson(),
    "jenjang": jenjang.toJson(),
  };
}

class Guru {
  final int id;
  final String name;
  final String email;
  final String phone;
  final dynamic description;
  final String isActive;
  final String mataPelajaranId;
  final String lokasiId;
  final String isVerified;
  final String sklIjazah;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Hari mataPelajaran;

  Guru({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.description,
    required this.isActive,
    required this.mataPelajaranId,
    required this.lokasiId,
    required this.isVerified,
    required this.sklIjazah,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.mataPelajaran,
  });

  factory Guru.fromJson(Map<String, dynamic> json) => Guru(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    description: json["description"],
    isActive: json["is_active"],
    mataPelajaranId: json["mata_pelajaran_id"],
    lokasiId: json["lokasi_id"],
    isVerified: json["is_verified"],
    sklIjazah: json["skl_ijazah"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    mataPelajaran: Hari.fromJson(json["mata_pelajaran"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "description": description,
    "is_active": isActive,
    "mata_pelajaran_id": mataPelajaranId,
    "lokasi_id": lokasiId,
    "is_verified": isVerified,
    "skl_ijazah": sklIjazah,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "mata_pelajaran": mataPelajaran.toJson(),
  };
}

class Hari {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Hari({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Hari.fromJson(Map<String, dynamic> json) => Hari(
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
