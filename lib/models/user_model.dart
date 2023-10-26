// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  final int id;
  final String name;
  final String email;
  final String emailVerified;
  final dynamic emailVerifiedAt;
  final String roleId;
  final dynamic image;
  final String secretToken;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerified,
    required this.emailVerifiedAt,
    required this.roleId,
    required this.image,
    required this.secretToken,
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
  };
}
