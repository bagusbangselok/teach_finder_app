// To parse this JSON data, do
//
//     final jadwalmodel = jadwalmodelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Jadwalmodel> jadwalmodelFromJson(String str) => List<Jadwalmodel>.from(json.decode(str).map((x) => Jadwalmodel.fromJson(x)));

String jadwalmodelToJson(List<Jadwalmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Jadwalmodel {
  final int id;
  final String name;
  final String guruId;
  final String hariId;
  final String mataPelajaranId;
  final String jenjangId;
  final String waktuMulai;
  final String waktuAkhir;
  final String harga;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Guru guru;
  final Hari hari;
  final Hari mataPelajaran;
  final Hari jenjang;

  Jadwalmodel({
    required this.id,
    required this.name,
    required this.guruId,
    required this.hariId,
    required this.mataPelajaranId,
    required this.jenjangId,
    required this.waktuMulai,
    required this.waktuAkhir,
    required this.harga,
    required this.createdAt,
    required this.updatedAt,
    required this.guru,
    required this.hari,
    required this.mataPelajaran,
    required this.jenjang,
  });

  factory Jadwalmodel.fromJson(Map<String, dynamic> json) => Jadwalmodel(
    id: json["id"],
    name: json["name"],
    guruId: json["guru_id"],
    hariId: json["hari_id"],
    mataPelajaranId: json["mata_pelajaran_id"],
    jenjangId: json["jenjang_id"],
    waktuMulai: json["waktu_mulai"],
    waktuAkhir: json["waktu_akhir"],
    harga: json["harga"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    guru: Guru.fromJson(json["guru"]),
    hari: Hari.fromJson(json["hari"]),
    mataPelajaran: Hari.fromJson(json["mata_pelajaran"]),
    jenjang: Hari.fromJson(json["jenjang"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guru_id": guruId,
    "hari_id": hariId,
    "mata_pelajaran_id": mataPelajaranId,
    "jenjang_id": jenjangId,
    "waktu_mulai": waktuMulai,
    "waktu_akhir": waktuAkhir,
    "harga": harga,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "guru": guru.toJson(),
    "hari": hari.toJson(),
    "mata_pelajaran": mataPelajaran.toJson(),
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
  final String lokasiId;
  final String isVerified;
  final String sklIjazah;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Guru({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.description,
    required this.isActive,
    required this.lokasiId,
    required this.isVerified,
    required this.sklIjazah,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Guru.fromJson(Map<String, dynamic> json) => Guru(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    description: json["description"],
    isActive: json["is_active"],
    lokasiId: json["lokasi_id"],
    isVerified: json["is_verified"],
    sklIjazah: json["skl_ijazah"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "description": description,
    "is_active": isActive,
    "lokasi_id": lokasiId,
    "is_verified": isVerified,
    "skl_ijazah": sklIjazah,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
