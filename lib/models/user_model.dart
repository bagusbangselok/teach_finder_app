// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final User user;

  UserModel({
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    user: User.fromJson(json["User"]),
  );

  Map<String, dynamic> toJson() => {
    "User": user.toJson(),
  };
}

class User {
  final int id;
  final String name;
  final String email;
  final String emailVerified;
  final dynamic emailVerifiedAt;
  final String roleId;
  final dynamic image;
  final String secretToken;
  final dynamic visibleToken;
  final DateTime lastLogin;
  final DateTime lastLogout;
  final String secretLink;
  final DateTime secretAt;
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
    emailVerifiedAt: json["email_verified_at"],
    roleId: json["role_id"],
    image: json["image"],
    secretToken: json["secret_token"],
    visibleToken: json["visible_token"],
    lastLogin: DateTime.parse(json["last_login"]),
    lastLogout: DateTime.parse(json["last_logout"]),
    secretLink: json["secret_link"],
    secretAt: DateTime.parse(json["secret_at"]),
    secretIsUsed: json["secret_is_used"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "visible_token": visibleToken,
    "last_login": lastLogin.toIso8601String(),
    "last_logout": lastLogout.toIso8601String(),
    "secret_link": secretLink,
    "secret_at": secretAt.toIso8601String(),
    "secret_is_used": secretIsUsed,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
