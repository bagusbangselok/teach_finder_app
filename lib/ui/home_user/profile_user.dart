import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

import 'package:teach_finder_app/ui/home_teacher/controller/profile_teacher_controller.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_schedule.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';
import 'package:teach_finder_app/ui/login/controllers/login_controller.dart';
import 'package:teach_finder_app/ui/login/login.dart';
import 'package:teach_finder_app/ui/utils/card_jadwal.dart';
import 'package:teach_finder_app/ui/welcome/welcome.dart';

class ProfileUser extends StatelessWidget {
  int selectedIndex = -1;
  List<Map<String, dynamic>> listJadwal = [
    {
      'isChecked': true,
      'hari': 'Senin',
      'time': '08.00 - 11.00',
    },
    {
      'isChecked': false,
      'hari': 'Selasa',
      'time': '10.00 - 11.00',
    },
    {
      'isChecked': false,
      'hari': 'Rabu',
      'time': '10.00 - 11.00',
    },
  ];

  ProfileTeacherController _profileTeacherController =
      ProfileTeacherController();
  LoginController _loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<UserModel?>(
            future: _profileTeacherController.getProfileByToken(),
            builder:
                (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
              return SingleChildScrollView(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeUser()),
                          );
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: blackColor,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text("Profile",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: blackColor,
                          ))
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 28),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: blackColor.withOpacity(0.4),
                              spreadRadius: 0.4,
                              blurRadius: 5,
                              offset: Offset(1, 4),
                            ),
                          ]),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Image.asset('assets/icon/icon_murid.png'),
                            ),
                            SizedBox(width: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data?.name ?? 'memuat...'}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: blackColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "${snapshot.data?.email ?? 'memuat...'}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8),
                                // Text(
                                //   "",
                                //   style: TextStyle(
                                //       fontSize: 14,
                                //       color: blackColor,
                                //       fontWeight: FontWeight.w500),
                                // ),
                              ],
                            ),
                          ])),
                  SizedBox(height: 32),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            _loginController.logoutUser();
                            _loginController.saveLoginStatus(false);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Welcome()),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            padding: EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: dangerColor,
                          ),
                          child: Row(children: [
                            Icon(Icons.power_settings_new,
                                size: 24, color: whiteColor),
                            SizedBox(width: 12),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.chevron_right,
                                    color: whiteColor, size: 28),
                              ),
                            )
                          ])))
                ]),
              ));
            }));
  }
}
