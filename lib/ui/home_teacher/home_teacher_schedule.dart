import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/jadwal_model.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/res/responsive.dart';
import 'package:teach_finder_app/ui/home_teacher/add_schedule.dart';
import 'package:teach_finder_app/ui/home_teacher/controller/jadwal_controller.dart';
import 'package:teach_finder_app/ui/home_teacher/controller/profile_teacher_controller.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_request.dart';
import 'package:teach_finder_app/ui/home_teacher/drawer_teacher.dart';
import 'package:teach_finder_app/ui/login/controllers/login_controller.dart';
import 'package:teach_finder_app/ui/utils/card_list_schedule.dart';
import 'package:intl/intl.dart';

class HomeTeacherSchedule extends StatelessWidget {
  bool showCardListSchedule = true;
  Responsive _responsive = Responsive();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProfileTeacherController _profileTeacherController =
      ProfileTeacherController();
  JadwalController _jadwalController = JadwalController();

  @override
  Widget build(BuildContext context) {
    LoginController _loginController = LoginController();
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerTeacher(),
      backgroundColor: primaryColor,
      body: FutureBuilder<UserModel?>(
          future: _profileTeacherController.getProfileByToken(),
          builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
            return SingleChildScrollView(
                child: Column(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 48.0),
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
                                Text("Halo ${snapshot.data?.name ?? '...'}",
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
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeTeacherRequest()),
                                      (route) => false
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
                              Text("Permintaan",
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
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 40, bottom: 0),
                    width: double.infinity,
                    height: 0.69 * _responsive.screenHeight(context),
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
                              children: <Widget>[
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
                                          builder: (context) => AddSchedule(userModel: snapshot.data!)),
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
                        SizedBox(height: 10),
                        // Conditional Function
                        !snapshot.hasData
                            ? Expanded(
                                child: Center(
                                    // render the loading indicator
                                    child: CircularProgressIndicator()),
                              )
                            : listSchedule(context),
                        SizedBox(height: 20),
                      ],
                    ),
                  ))
            ]));
          }),
    );
  }

  Widget listSchedule(BuildContext context) {
    NumberFormat moneyFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return FutureBuilder<List<JadwalModel>>(
        future: _jadwalController.getListJadwal(),
        builder: (BuildContext context,
            AsyncSnapshot<List<JadwalModel>> snapshotJadwal) {
          return !snapshotJadwal.hasData
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : snapshotJadwal.data!.isEmpty
                  ? isEmptyData()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: snapshotJadwal.data?.length,
                          itemBuilder: (context, index) {
                            var harga =
                                int.parse(snapshotJadwal.data![index].harga);
                            assert(harga is int);
                            return SingleChildScrollView(
                              child: CardListSchedule(
                                  name: "${snapshotJadwal.data![index].name}",
                                  MataPelajaran:
                                      "${snapshotJadwal.data![index].guru.mataPelajaran.name}",
                                  hari:
                                      "${snapshotJadwal.data![index].hari.name}",
                                  jenjang:
                                      "${snapshotJadwal.data![index].jenjang.name}",
                                  harga: "${moneyFormat.format(harga)} / Jam"),
                            );
                          }),
                    );
        });
  }

  Widget isEmptyData() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Image.asset("/assets/illustration/schedule_empty.png"),
          Text("Belum ada jadwal",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))
        ],
      )
    );
  }
}