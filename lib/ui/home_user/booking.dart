import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/add_schedule.dart';
import 'package:teach_finder_app/ui/home_user/detail_home.dart';
import 'package:teach_finder_app/ui/home_user/drawer_user.dart';
import 'package:teach_finder_app/ui/page_not_found/schedule_not_found.dart';
import 'package:teach_finder_app/ui/utils/card_booking_teacher.dart';
import 'package:teach_finder_app/ui/utils/card_list_schedule.dart';
import 'package:teach_finder_app/ui/utils/card_list_teacher.dart';
import 'package:teach_finder_app/ui/utils/card_list_user.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _Booking();
}

class _Booking extends State<Booking> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool ShowCardListBooking = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: DrawerUser(),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                            color: Colors.white,
                            size: 30, // Changing Drawer Icon Size
                          ),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset("assets/icon/icon_white.png",
                              width: 50),
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
                                Text("Halo, Daniel !!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 12),
                                Text("Ingin mencari guru private mapel apa ??",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        ),
                        Image.asset("assets/illustration/user.png", height: 100)
                      ],
                    ),
                  ],
                ),
              ),
              // Container list guru private
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 44),
                  width: double.infinity,
                  height: 1000,
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                                "Data Pemesanan Saya",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                      ),
                      SizedBox(height: 20),
                      // Conditional Function
                      if (ShowCardListBooking)
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CardListBooking(
                                urlImage: "assets/icon/user_icon1.png",
                                name: "M. Fattah, S.Pd",
                                location: "Keputih",
                                subject: "Matematika",
                                salary: "85.000",
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        )
                      else
                        ScheduleNotFound(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
