import 'package:dio/dio.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/res/url.dart';

class RegisterProvider {
  final Dio _dio = Dio();

  Future<dynamic> registerTeacher({
    required String name,
    required String password,
    required String confirm_password,
    required String email,
    required String phone,
    required String skl_ijazah,
    required String alamat,
    required String alamat_id,
  }) async {
    try {
      final response = await _dio.post(Url.REGISTER_USER, data: {
        'name': name,
        'password': password,
        'confirm_password': confirm_password,
        'email': email,
        'phone': phone,
        'skl_ijazah': skl_ijazah,
        'lokasi_id': 2,
        'alamat': alamat,
        'alamat_id': alamat_id,
      });

      if (response.statusCode == 200) {
        if(response.data['success']){
          return true;
        }
        else return false;
      } else {
        // Gagal mendaftar
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

  Future<dynamic> registerUser({
    required String name,
    required String password,
    required String confirm_password,
    required String email,
    required String phone,
    required String jenjang_id,
    required String alamat,
  }) async {
    try {
      final response = await _dio.post(Url.REGISTER_USER, data: {
        'name': name,
        'password': password,
        'confirm_password': confirm_password,
        'email': email,
        'phone': phone,
        'jenjang_id': jenjang_id,
        'alamat': alamat,
      });

      if (response.statusCode == 200) {
        if(response.data['success']){
          return true;
        }
        else return false;
      } else {
        // Gagal mendaftar
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }
}
