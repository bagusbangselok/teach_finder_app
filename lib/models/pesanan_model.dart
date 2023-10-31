// To parse this JSON data, do
//
//     final pesananModel = pesananModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PesananModel pesananModelFromJson(String str) => PesananModel.fromJson(json.decode(str));

String pesananModelToJson(PesananModel data) => json.encode(data.toJson());

class PesananModel {
  final int id;
  final String muridId;
  final String guruId;
  final String jadwalId;
  final String status;
  final dynamic description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Murid murid;
  final Guru guru;
  final Jadwal jadwal;

  PesananModel({
    required this.id,
    required this.muridId,
    required this.guruId,
    required this.jadwalId,
    required this.status,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.murid,
    required this.guru,
    required this.jadwal,
  });

  factory PesananModel.fromJson(Map<String, dynamic> json) => PesananModel(
    id: json["id"],
    muridId: json["murid_id"],
    guruId: json["guru_id"],
    jadwalId: json["jadwal_id"],
    status: json["status"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    murid: Murid.fromJson(json["murid"]),
    guru: Guru.fromJson(json["guru"]),
    jadwal: Jadwal.fromJson(json["jadwal"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "murid_id": muridId,
    "guru_id": guruId,
    "jadwal_id": jadwalId,
    "status": status,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "murid": murid.toJson(),
    "guru": guru.toJson(),
    "jadwal": jadwal.toJson(),
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
  final Lokasi lokasi;

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
    required this.lokasi,
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
    lokasi: Lokasi.fromJson(json["lokasi"]),
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
    "lokasi": lokasi.toJson(),
  };
}

class Lokasi {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Lokasi({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lokasi.fromJson(Map<String, dynamic> json) => Lokasi(
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

class Jadwal {
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
  final Lokasi hari;
  final Lokasi mataPelajaran;

  Jadwal({
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
    required this.hari,
    required this.mataPelajaran,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
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
    hari: Lokasi.fromJson(json["hari"]),
    mataPelajaran: Lokasi.fromJson(json["mata_pelajaran"]),
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
    "hari": hari.toJson(),
    "mata_pelajaran": mataPelajaran.toJson(),
  };
}

class Murid {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String pin;
  final String jenjangId;
  final String alamat;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Lokasi jenjang;

  Murid({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.pin,
    required this.jenjangId,
    required this.alamat,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.jenjang,
  });

  factory Murid.fromJson(Map<String, dynamic> json) => Murid(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    pin: json["pin"],
    jenjangId: json["jenjang_id"],
    alamat: json["alamat"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    jenjang: Lokasi.fromJson(json["jenjang"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "pin": pin,
    "jenjang_id": jenjangId,
    "alamat": alamat,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "jenjang": jenjang.toJson(),
  };
}
