import 'dart:convert';

MataPelajaranModel jenjangModelFromJson(String str) =>
    MataPelajaranModel.fromJson(json.decode(str));

String jenjangModelToJson(MataPelajaranModel data) =>
    json.encode(data.toJson());

class MataPelajaranModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  MataPelajaranModel({this.id, this.name, this.createdAt, this.updatedAt});

  MataPelajaranModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
