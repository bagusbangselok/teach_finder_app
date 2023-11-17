import 'dart:convert';

JenjangModel jenjangModelFromJson(String str) =>
    JenjangModel.fromJson(json.decode(str));

String jenjangModelToJson(JenjangModel data) => json.encode(data.toJson());

class JenjangModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  JenjangModel({this.id, this.name, this.createdAt, this.updatedAt});

  JenjangModel.fromJson(Map<String, dynamic> json) {
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
