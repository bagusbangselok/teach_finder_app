// To parse this JSON data, do
//
//     final hariModel = hariModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HariModel hariModelFromJson(String str) => HariModel.fromJson(json.decode(str));

String hariModelToJson(HariModel data) => json.encode(data.toJson());

class HariModel {
  final int id;
  final String name;

  HariModel({
    required this.id,
    required this.name,
  });

  factory HariModel.fromJson(Map<String, dynamic> json) => HariModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
