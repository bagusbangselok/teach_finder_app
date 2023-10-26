import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_request.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';
import 'package:teach_finder_app/ui/login/controllers/login_controller.dart';
import 'package:teach_finder_app/ui/login/login.dart';
import 'package:teach_finder_app/ui/login/providers/login_provider.dart';
import 'package:teach_finder_app/ui/welcome/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // final isLoggedIn = await prefs.getBool('isLoggedIn') ?? false;
  LoginController _loginController = LoginController();
  LoginProvider _loginProvider = LoginProvider();
  bool isLoggedIn = await _loginController.getIsLoggedIn();
  final user = await _loginProvider.getProfilUser();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splashTransition: SplashTransition.fadeTransition,
          splash: Center(
            child: Image.asset(
              "assets/icon/icon_color.png",
              height: 200,
            ),
          ),
          nextScreen: loginRole(isLoggedIn, user)
        )
      )
    );
}
Widget loginRole(isLoggedIn, user) {
  LoginController _loginController = LoginController();
  print("login : ${isLoggedIn}");
  // print("role: ${user.roleId}");
  if(isLoggedIn == true){
    print("aku");
    if(user.roleId == '2'){
      return HomeTeacherRequest(userId: _loginController.getId());
    } else if(user.roleId == '3'){
      print("role3");
      return HomeUser();
    }
  } else if (!isLoggedIn) {
    return Welcome();
  }
  return Center();
}