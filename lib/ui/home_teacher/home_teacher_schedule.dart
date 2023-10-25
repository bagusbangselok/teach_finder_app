import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/add_schedule.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_request.dart';
import 'package:teach_finder_app/ui/home_teacher/drawer_teacher.dart';
import 'package:teach_finder_app/ui/home_user/detail_home.dart';
import 'package:teach_finder_app/ui/login/login.dart';
import 'package:teach_finder_app/ui/page_not_found/schedule_not_found.dart';
import 'package:teach_finder_app/ui/utils/card_list_schedule.dart';
import 'package:teach_finder_app/ui/utils/card_list_teacher.dart';
import 'package:teach_finder_app/ui/utils/card_list_user.dart';

class HomeTeacherSchedule extends StatelessWidget {
  bool showCardListSchedule = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerTeacher(),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: whiteColor,
                      size: 30, // Changing Drawer Icon Size
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset("assets/icon/icon_white.png", width: 50),
                    borderRadius: BorderRadius.circular(50),
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(right: 40, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Adella Agatha",
                              style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 12),
                          Row()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: secondaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Data Jadwal",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeTeacherRequest(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: whiteColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(children: [
                        Icon(
                          Icons.person,
                          color: secondaryColor,
                        ),
                        SizedBox(width: 4),
                        Text("User Request",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: secondaryColor,
                            ))
                      ])),
                ],
              )
            ],
          ),
        ),
        // Container list siswa
        SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              width: double.infinity,
              height: 1000,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  shape: BoxShape.rectangle),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Data Jadwal",
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddSchedule()),
                              );
                            },
                            child: Icon(
                              Icons.add,
                              color: blackColor,
                              size: 30,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(height: 20),
                  // Conditional Function
                  if (showCardListSchedule)
                    Column(
                      children: [
                        CardListSchedule(
                            MataPelajaran: "Matematika",
                            hari: "Senin",
                            jenjang: "SMP",
                            harga: "85.000 / Jam"),
                        SizedBox(height: 16),
                        CardListSchedule(
                            MataPelajaran: "Matematika",
                            hari: "Selasa",
                            jenjang: "SMA",
                            harga: "100.000 / Jam"),
                      ],
                    )
                  else
                    ScheduleNotFound(),
                  SizedBox(height: 20),
                ],
              ),
            ))
      ])),
    );
  }
}
