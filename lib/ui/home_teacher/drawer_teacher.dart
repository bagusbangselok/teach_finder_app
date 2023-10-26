import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/history.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_request.dart';
import 'package:teach_finder_app/ui/home_teacher/profile_teacher.dart';

class DrawerTeacher extends StatelessWidget {
  Widget buildHeader(BuildContext context) => (Column(
        children: [],
      ));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                color: primaryColor,
                padding: EdgeInsets.only(
                  top: 24 + MediaQuery.of(context).padding.top,
                  bottom: 24,
                ),
                child: Column(children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/icon/user_icon2.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Adella Agatha",
                    style: TextStyle(
                        fontSize: 24,
                        color: whiteColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text("adella_agatha@gmail.com",
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
                    leading: const Icon(Icons.history, color: blackColor),
                    title: const Text(
                      "History",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => History()));
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
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => ProfileTeacher())),
                    trailing: Icon(Icons.chevron_right, color: blackColor),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}