import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/login/controllers/login_controller.dart';
import 'package:teach_finder_app/ui/login/login.dart';
import 'package:teach_finder_app/ui/register/register_guru.dart';
import 'package:teach_finder_app/ui/register/register_user.dart';

class Welcome extends StatelessWidget {
  LoginController _loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/icon/icon_header.png", height: 25),
                SizedBox(height: 25),
                Image.asset("assets/illustration/welcome.jpg"),
                SizedBox(height: 28),
                Center(
                    child: Column(
                  children: [
                    Text("Selamat datang di TeachFinder!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22)),
                    SizedBox(height: 14),
                    Text(
                        "Aplikasi dimana kamu bisa mencari guru private di area yang kamu mau",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 16)),
                    SizedBox(height: 82),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ))),
                    SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterUser()),
                              );
                              // final Uri _urlUser = Uri.parse(
                              //     'https://bit.ly/RegistrasiUserTeachfinder');
                              // await launchUrl(_urlUser,
                              //     mode: LaunchMode.inAppBrowserView);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(
                                    color: Color(0xFF00A7FF), width: 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Text(
                              "Daftar sebagai murid",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor),
                            ))),
                    SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterGuru()),
                              );
                              // final Uri _urlGuru = Uri.parse(
                              //     'https://bit.ly/RegistrasiGuruTeachfinder');
                              // await launchUrl(_urlGuru,
                              //     mode: LaunchMode.inAppBrowserView);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(
                                    color: Color(0xFF00A7FF), width: 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Text(
                              "Daftar sebagai guru",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor),
                            ))),
                    SizedBox(height: 20),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}
