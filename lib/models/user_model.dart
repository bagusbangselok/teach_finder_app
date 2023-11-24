// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int id;
  final String name;
  final String email;
  final String emailVerified;
  final dynamic emailVerifiedAt;
  final String roleId;
  final dynamic image;
  final String secretToken;
  final Guru? guru;
  final Murid? murid;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerified,
    required this.emailVerifiedAt,
    required this.roleId,
    required this.image,
    required this.secretToken,
    required this.guru,
    required this.murid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerified: json["email_verified"],
    emailVerifiedAt: json["email_verified_at"],
    roleId: json["role_id"],
    image: json["image"],
    secretToken: json["secret_token"],
    guru: Guru.fromJson(json["guru"] ?? json["murid"]),
    murid: Murid.fromJson(json["murid"] ?? json["guru"])
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified": emailVerified,
    "email_verified_at": emailVerifiedAt,
    "role_id": roleId,
    "image": image,
    "secret_token": secretToken,
    "guru": guru?.toJson(),
    "murid": murid?.toJson(),
  };
}

class Guru {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic description;
  final String? isActive;
  final String? mataPelajaranId;
  final String? lokasiId;
  final String? isVerified;
  final String? sklIjazah;
  final String? userId;

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
  };


}

class Murid {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? pin;
  final String? jenjangId;
  final String? alamat;
  final String? userId;

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
