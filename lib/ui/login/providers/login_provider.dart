import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_request.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';

class LoginProvider {
  final Dio _dio = Dio();

  // FormData formData = FormData.fromMap({
  // });

  Future<UserModel?> loginAccount(BuildContext context, String email, String password) async {
    try {
      final response = await _dio.post(
        'https://teachfinder.agiftsany-azhar.web.id/api/user/login',
        data: {
          'email': email,
          'password': password
        });
      print(response.data['success']);
      print(response.data);
      print(response.statusCode);
      final tokenKey = response.data['user']['secret_token'];
      print(response.data['user']['role_id']);
      final id = response.data['user']['id'];
      saveProfileId(id);
      if (response.statusCode == 200) {
        if(response.data['success']){
          print('success!!');
          var role = response.data['user']['role_id'];
          if(role == '2') {
            print('role 2');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeTeacherRequest(userId: response.data['user']['id']),
              ),
            );
          } else if(role == '3'){
            print('role 3');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeUser(),
              ),
            );
          } else return null;
          return UserModel.fromJson(response.data);
        }
      }
    } on DioError catch (e) {
      print('Error during login: $e');
    }
  }

  Future<TeacherModel?> saveProfileId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('profileId', id);
  }

  Future<int> getProfileId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int profileId = prefs.getInt('profileId') ?? 0; // Menggunakan 0 sebagai nilai default jika ID tidak tersedia
    return profileId;
  }

  Future<UserModel?> getProfilUser() async {
    print("object");
    try {
      Options headers = Options(
        headers: {
          'Authorization': 'm4Bsf3Rb9XGqHKI4623KPl4Kr12x72SOQ92hpKdZ',
        }
      );
      final response = await _dio.get(
          'https://teachfinder.agiftsany-azhar.web.id/api/user/show',
          options: headers
      );
      print(response.data['user']);
      print(response.statusCode);

      if (response.statusCode == 200) {
        if(response.data['success']){
          return UserModel.fromJson(response.data);
        }
      }
    } on DioError catch (e) {
      print('Error during login: $e');
    }
    return null;
  }


}
