import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/login/providers/login_provider.dart';

class LoginController {
  late final GlobalKey<FormState> loginFormKey;
  final LoginProvider _loginProvider = LoginProvider();
  bool obscureText = true;

  void loginProcess(BuildContext context, String email, String password) async {
    final user = await _loginProvider.loginAccount(context, email, password);
    print('user: $user');


    if (user != null) {
      String authToken = user.secretToken;
      _loginProvider.saveUserSession(authToken);

      print('Login berhasil: ${user.email}');
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

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    return authToken != null;
  }

  Future<bool> getIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    final isLoggedIn = authToken != null;
    return isLoggedIn;
  }

  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken'); // atau sesuaikan dengan data sesi lainnya yang perlu dihapus
  }

  Future<void> saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<int> getId() async{
    return await _loginProvider.getProfileId();
  }

  // Future<void> sendAuthenticatedRequest() async {
  //   final authToken = await getAuthToken();
  //
  //   if (authToken != null) {
  //     // Buat permintaan HTTP dengan header Authorization
  //     // Misalnya, dengan menggunakan pustaka Dio:
  //     final dio = Dio();
  //     dio.options.headers["Authorization"] = "Bearer $authToken";
  //
  //     // Lakukan permintaan HTTP yang diotorisasi di sini
  //     // ...
  //   } else {
  //     // Token tidak tersedia, pengguna mungkin belum login
  //     // Mungkin arahkan mereka ke halaman login atau tampilkan pesan kesalahan.
  //   }
  // }
}