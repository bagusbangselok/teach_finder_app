import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';
import 'package:teach_finder_app/ui/login/providers/login_provider.dart';

class LoginController {
  late final GlobalKey<FormState> loginFormKey;
  final LoginProvider _loginProvider = LoginProvider();

  // void _validateInputs() {
  //   if (loginFormKey.currentState!.validate()) {
  //     //If all data are correct then save data to out variables
  //     loginFormKey.currentState!.save();
  //
  //     doLogin(txtEditEmail.text, txtEditPwd.text);
  //   }
  // }

  void loginProcess(BuildContext context, String email, String password) async {
    final user = await _loginProvider.loginAccount(context, email, password);
    print('user: $user');


    if (user != null) {
      String authToken = user.user.secretToken;
      saveUserSession(authToken);

      print('Login berhasil: ${user.user.email}');
      saveLoginStatus(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Login gagal. Email atau password tidak valid.',
                  style: TextStyle(
                    color: dangerColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                ),
          )
      );
    }
  }



  void saveUserSession(String authToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', authToken);
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    return authToken != null;
  }

  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken'); // atau sesuaikan dengan data sesi lainnya yang perlu dihapus
  }

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<int> getId() async{
    return await _loginProvider.getProfileId();
  }

  Future<void> sendAuthenticatedRequest() async {
    final authToken = await getAuthToken();

    if (authToken != null) {
      // Buat permintaan HTTP dengan header Authorization
      // Misalnya, dengan menggunakan pustaka Dio:
      final dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $authToken";

      // Lakukan permintaan HTTP yang diotorisasi di sini
      // ...
    } else {
      // Token tidak tersedia, pengguna mungkin belum login
      // Mungkin arahkan mereka ke halaman login atau tampilkan pesan kesalahan.
    }
  }
}