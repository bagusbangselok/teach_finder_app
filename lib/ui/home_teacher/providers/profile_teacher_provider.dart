import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/res/url.dart';
import 'package:teach_finder_app/ui/home_teacher/history.dart';

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

  Future<dynamic> IgnoreRequest(int idPesanan, String description, context) async {
    Dio dio = Dio();

    // Define the API endpoint and request data
    String apiUrl = Url.BASE_URL + '/pesanan/update/${idPesanan}';
    Map<String, dynamic> postData = {
      'status': 2,
      'description': description
    };

    try {
      Response response = await dio.post(apiUrl, data: postData);

      if (response.statusCode == 200) {
        // Request was successful
        if (response.data['success']) {
          print("Sukses Menolak");
          print(response.data['message']);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => History()),
          );
        }
        print('Response data: ${response.data}');
      } else {
        // Handle errors
        print(
            'Failed to make the POST request. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or request errors
      print('Error: $error');
    }
  }

}