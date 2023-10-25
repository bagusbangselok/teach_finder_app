import 'dart:async';
import 'package:dio/dio.dart';
import 'package:teach_finder_app/models/user_model.dart';

class  UserRepository {
  final Dio _dio = Dio();

  Future<UserModel> login({required String email, required String password}) async {
    try {
      // Ganti URL dengan URL login Anda
      final response = await _dio.post('http://127.0.0.1:8000/api/user/login', data: {
        'email': email,
        'password': password,
      });

      print(response.data);
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return UserModel.fromJson(data);
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
