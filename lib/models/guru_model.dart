// To parse this JSON data, do
//
//     final guruModel = guruModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GuruModel guruModelFromJson(String str) => GuruModel.fromJson(json.decode(str));

String guruModelToJson(GuruModel data) => json.encode(data.toJson());

class GuruModel {
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
  final int avgPrice;
  final int ratingAverage;
  final List<Testimonial> testimonials;
  final List<Jadwal> jadwal;
  final Lokasi lokasi;
  final List<AlamatGuru> alamatGuru;
  final User user;
  final Lokasi mataPelajaran;

  GuruModel({
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
    required this.avgPrice,
    required this.ratingAverage,
    required this.testimonials,
    required this.jadwal,
    required this.lokasi,
    required this.alamatGuru,
    required this.user,
    required this.mataPelajaran,
  });

  factory GuruModel.fromJson(Map<String, dynamic> json) => GuruModel(
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
    avgPrice: json["avgPrice"],
    ratingAverage: json["ratingAverage"],
    testimonials: List<Testimonial>.from(json["testimonials"].map((x) => Testimonial.fromJson(x))),
    jadwal: List<Jadwal>.from(json["jadwal"].map((x) => Jadwal.fromJson(x))),
    lokasi: Lokasi.fromJson(json["lokasi"]),
    alamatGuru: List<AlamatGuru>.from(json["alamat_guru"].map((x) => AlamatGuru.fromJson(x))),
    user: User.fromJson(json["user"]),
    mataPelajaran: Lokasi.fromJson(json["mata_pelajaran"]),
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
    "avgPrice": avgPrice,
    "ratingAverage": ratingAverage,
    "testimonials": List<dynamic>.from(testimonials.map((x) => x.toJson())),
    "jadwal": List<dynamic>.from(jadwal.map((x) => x.toJson())),
    "lokasi": lokasi.toJson(),
    "alamat_guru": List<dynamic>.from(alamatGuru.map((x) => x.toJson())),
    "user": user.toJson(),
    "mata_pelajaran": mataPelajaran.toJson(),
  };
}

class AlamatGuru {
  final int id;
  final String guruId;
  final String alamat;
  final DateTime createdAt;
  final DateTime updatedAt;

  AlamatGuru({
    required this.id,
    required this.guruId,
    required this.alamat,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AlamatGuru.fromJson(Map<String, dynamic> json) => AlamatGuru(
    id: json["id"],
    guruId: json["guru_id"],
    alamat: json["alamat"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "guru_id": guruId,
    "alamat": alamat,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Jadwal {
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

  Jadwal({
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
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
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

class Testimonial {
  final int id;
  final String pengirimId;
  final String penerimaId;
  final String description;
  final String nilai;
  final DateTime createdAt;
  final DateTime updatedAt;

  Testimonial({
    required this.id,
    required this.pengirimId,
    required this.penerimaId,
    required this.description,
    required this.nilai,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
    id: json["id"],
    pengirimId: json["pengirim_id"],
    penerimaId: json["penerima_id"],
    description: json["description"],
    nilai: json["nilai"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pengirim_id": pengirimId,
    "penerima_id": penerimaId,
    "description": description,
    "nilai": nilai,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class User {
  final int id;
  final String name;
  final String email;
  final String emailVerified;
  final DateTime emailVerifiedAt;
  final String roleId;
  final dynamic image;
  final String secretToken;
  final dynamic visibleToken;
  final dynamic lastLogin;
  final dynamic lastLogout;
  final String secretLink;
  final dynamic secretAt;
  final String secretIsUsed;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerified,
    required this.emailVerifiedAt,
    required this.roleId,
    required this.image,
    required this.secretToken,
    required this.visibleToken,
    required this.lastLogin,
    required this.lastLogout,
    required this.secretLink,
    required this.secretAt,
    required this.secretIsUsed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerified: json["email_verified"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    roleId: json["role_id"],
    image: json["image"],
    secretToken: json["secret_token"],
    visibleToken: json["visible_token"],
    lastLogin: json["last_login"],
    lastLogout: json["last_logout"],
    secretLink: json["secret_link"],
    secretAt: json["secret_at"],
    secretIsUsed: json["secret_is_used"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified": emailVerified,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "role_id": roleId,
    "image": image,
    "secret_token": secretToken,
    "visible_token": visibleToken,
    "last_login": lastLogin,
    "last_logout": lastLogout,
    "secret_link": secretLink,
    "secret_at": secretAt,
    "secret_is_used": secretIsUsed,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
