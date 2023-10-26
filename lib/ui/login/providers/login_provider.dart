import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_request.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';

class LoginProvider {
  final Dio _dio = Dio();
  var currentUser;
  var user;
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

      final tokenKey = response.data['user']['secret_token'];
      final id = response.data['user']['id'];
      user = response.data['user'];

      print(response.data['success']);
      print(response.data);
      print(response.statusCode);
      print(response.data['user']['role_id']);

      saveProfileId(id);
      saveUserSession(tokenKey);

      print("id = ${getProfileId().toString()}");
      print("userr = ${getProfilUser}");

      if (response.statusCode == 200) {
        if(response.data['success']){
          print('success!!');
          var role = response.data['user']['role_id'];
          if(role == '2') {
            print('role 2');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeTeacherRequest(),
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
          final json = jsonDecode(response.data);
          currentUser.value = UserModel.fromJson(json);
          return currentUser.value;
        }
      }
    } on DioError catch (e) {
      print('Error during login: $e');
    }
  }

  void saveUserSession(String authToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', authToken);
    print("token : ${prefs.getString('authToken')}");
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

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<UserModel?> getProfilUser() async {
    print("object");
    getAuthToken();
    print("tokenn : ${getAuthToken()}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Options headers = Options(
        headers: {
          'Authorization': prefs.getString('authToken'),
        }
      );
      final response = await _dio.get(
          'https://teachfinder.agiftsany-azhar.web.id/api/user/show',
          options: headers
      );
      print(response.data);
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("dataUser: ${response.data['user']}");
        if(response.data['success']){
          var json = response.data['User'];
          print("json: ${json}");
          return UserModel.fromJson(response.data['User']);
        }
      }
    } on DioError catch (e) {
      print('Error during login: $e');
    }
    return null;
  }


}
