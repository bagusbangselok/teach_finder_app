import 'dart:convert';

List<JenjangModel> jenjangModelFromJson(String str) => List<JenjangModel>.from(
    json.decode(str).map((x) => JenjangModel.fromJson(x)));

String jenjangModelToJson(List<JenjangModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JenjangModel {
  int? id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  JenjangModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JenjangModel.fromJson(Map<String, dynamic> json) => JenjangModel(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
