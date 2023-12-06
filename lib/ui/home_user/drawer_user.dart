import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/controller/profile_teacher_controller.dart';
import 'package:teach_finder_app/ui/home_user/booking.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';
import 'package:teach_finder_app/ui/home_user/profile_user.dart';

class DrawerUser extends StatelessWidget {
  ProfileTeacherController _profileTeacherController = ProfileTeacherController();
  Widget buildHeader(BuildContext context) => (Column(
        children: [],
      ));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: SingleChildScrollView(
        child: FutureBuilder<UserModel?>(
            future: _profileTeacherController.getProfileByToken(),
            builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    color: primaryColor,
                    padding: EdgeInsets.only(
                      top: 24 + MediaQuery.of(context).padding.top,
                      bottom: 24,
                    ),
                    child: Column(children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                        backgroundImage: AssetImage('assets/icon/icon_murid.png'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "${snapshot.data?.name ?? 'memuat..'}",
                        style: TextStyle(
                            fontSize: 24,
                            color: whiteColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text("${snapshot.data?.email ?? 'memuat...'}",
                          style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            fontWeight: FontWeight.w400,
                          ))
                    ])),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                    child: Wrap(runSpacing: 12, children: [
                      ListTile(
                        leading: const Icon(Icons.home, color: blackColor),
                        title: const Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => HomeUser()));
                        },
                        trailing: Icon(Icons.chevron_right, color: blackColor),
                      ),
                      ListTile(
                        leading: const Icon(Icons.note_add, color: blackColor),
                        title: const Text(
                          "Pemesanan",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Booking()));
                        },
                        trailing: Icon(Icons.chevron_right, color: blackColor),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person, color: blackColor),
                        title: const Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileUser()));
                        },
                        trailing: Icon(Icons.chevron_right, color: blackColor),
                      ),
                    ]))
              ],
            );
          }
        ),
      ),
    );
  }
}
