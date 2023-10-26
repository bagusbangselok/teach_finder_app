import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_request.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';
import 'package:teach_finder_app/ui/login/controllers/login_controller.dart';
import 'package:teach_finder_app/ui/login/login.dart';
import 'package:teach_finder_app/ui/register/register_user.dart';
import 'package:teach_finder_app/ui/register/register_Guru.dart';

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
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
                  SizedBox(height: 14),
                  Text(
                      "Aplikasi dimana kamu bisa mencari guru private di area yang kamu mau",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
                  SizedBox(height: 82),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterUser()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side:
                                  BorderSide(color: Color(0xFF00A7FF), width: 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text(
                            "Daftar sebagai pengguna",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: primaryColor),
                          ))),
                  SizedBox(height: 20),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterGuru()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side:
                                  BorderSide(color: Color(0xFF00A7FF), width: 1),
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
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeUser()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side:
                                  BorderSide(color: Color(0xFF00A7FF), width: 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text(
                            "Home User",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: primaryColor),
                          )
                      )
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeTeacherRequest(),
                              )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side:
                              BorderSide(color: primaryColor, width: 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text(
                            "Home Teacher",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: primaryColor),
                          )
                      )
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    ));
  }
}
