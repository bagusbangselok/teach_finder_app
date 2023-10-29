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
  final String description;
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

  Murid({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.pin,
    required this.jenjangId,
    required this.alamat,
    required this.userId,
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
  };
}
