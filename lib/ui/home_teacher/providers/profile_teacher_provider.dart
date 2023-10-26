import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/guru_model.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/ui/login/providers/login_provider.dart';

class ProfileTeacherProvider {
  final Dio _dio = Dio();

  Future<List<TeacherModel>?> getTeacher() async {
    try {
      final response = await _dio.get(
          'https://teachfinder.agiftsany-azhar.web.id/api/guru');

      if (response.statusCode == 200) {
        debugPrint("${response.data["data"]}");
        final list = List<TeacherModel>.from(
            response.data["data"].map((data) => TeacherModel.fromJson(data)));
        return list;
      } else {
        throw Exception('Gagal mendapatkan profil');
      }
    } on DioError catch (e) {
      print('Error during login: $e');
    }
  }

  Future<TeacherModel?> getTeacherById(int id) async {
    try {
      final response = await _dio.get(
          'https://teachfinder.agiftsany-azhar.web.id/api/guru?id=$id');

      if (response.statusCode == 200) {
        debugPrint("${response.data["data"]}");
        return TeacherModel.fromJson(response.data["data"]);
      } else {
        throw Exception('Gagal mendapatkan profil');
      }
    } on DioError catch (e) {
      print('Error during login: $e');
    }
  }

  Future<List<TeacherModel>?> getListTeacherById(int id) async {
    try {
      final response = await _dio.get(
          'https://teachfinder.agiftsany-azhar.web.id/api/guru?id=$id');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List;
        List<TeacherModel> items = data.map((item) => TeacherModel.fromJson(item)).toList();
        return items;
      } else {
        throw Exception('Gagal mendapatkan profil');
      }
    } on DioError catch (e) {
      print('Error during login: $e');
    }
  }



}