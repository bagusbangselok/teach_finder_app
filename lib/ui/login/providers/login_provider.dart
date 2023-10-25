import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/murid_model.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher.dart';
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
      
      if (response.statusCode == 200) {
        if(response.data['success']){
          print('success!!');
          var role = response.data['user']['role_id'];
          if(role == '2') {
            print('role 2');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeTeacher(),
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
