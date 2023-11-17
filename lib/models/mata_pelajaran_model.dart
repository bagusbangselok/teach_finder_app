import 'dart:convert';

MataPelajaranModel jenjangModelFromJson(String str) =>
    MataPelajaranModel.fromJson(json.decode(str));

String jenjangModelToJson(MataPelajaranModel data) =>
    json.encode(data.toJson());

class MataPelajaranModel {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  MataPelajaranModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MataPelajaranModel.fromJson(Map<String, dynamic> json) =>
      MataPelajaranModel(
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
