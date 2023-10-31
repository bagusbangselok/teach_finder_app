import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/controller/profile_teacher_controller.dart';
import 'package:teach_finder_app/ui/home_teacher/detail_home_request.dart';
import 'package:teach_finder_app/ui/home_teacher/drawer_teacher.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_schedule.dart';
import 'package:teach_finder_app/ui/home_user/detail_home.dart';
import 'package:teach_finder_app/ui/page_not_found/request_not_found.dart';
import 'package:teach_finder_app/ui/utils/card_list_user.dart';

class HomeTeacherRequest extends StatefulWidget {
  @override
  _HomeTeacherRequestState createState() => _HomeTeacherRequestState();
}

class _HomeTeacherRequestState extends State<HomeTeacherRequest> {
  bool showCardListUser = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProfileTeacherController _profileTeacherController = ProfileTeacherController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerTeacher(),
      backgroundColor: primaryColor,
      body: FutureBuilder<UserModel?>(
          future: _profileTeacherController.getProfileByToken(),
          builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
            print(_profileTeacherController.getProfileByToken());
            print("data : ${snapshot.data}");
            return SingleChildScrollView(
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
                                Text("${snapshot.data?.name}",
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
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeTeacherSchedule()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: whiteColor,
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
                              color: secondaryColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeTeacherRequest()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: secondaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(children: [
                              Icon(
                                Icons.person,
                                color: whiteColor,
                              ),
                              SizedBox(width: 4),
                              Text("User Request",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: whiteColor,
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
                    padding: EdgeInsets.only(left: 20, right: 20, top: 44),
                    width: double.infinity,
                    height: 540,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        shape: BoxShape.rectangle),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "List User Request",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        // Conditional
                        !snapshot.hasData
                            ? Expanded(
                                child: Center(
                                    // render the loading indicator
                                    child: CircularProgressIndicator()),
                              )
                            : listRequest(context)
                      ],
                    ),
                  ))
            ]));
          }),
    );
  }

  Widget listRequest(BuildContext context) {
    return FutureBuilder<List<PesananModel>>(
        future: _profileTeacherController.getListPesananGuru(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PesananModel>> snapshotPesanan) {
          print('dataaa : ${snapshotPesanan.data}');
          return !snapshotPesanan.hasData
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: snapshotPesanan.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleChildScrollView(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailHomeRequest(pesanan: snapshotPesanan.data![index])),
                              );
                            },
                            child: CardListUser(
                              urlImage: "assets/icon/user_icon1.png",
                              name:
                                  "${snapshotPesanan.data![index].murid.name}",
                              level:
                                  "${snapshotPesanan.data![index].murid.jenjang.name}",
                              subject:
                                  "${snapshotPesanan.data![index].jadwal.mataPelajaran.name}",
                              time:
                                  "${snapshotPesanan.data![index].jadwal.hari.name}: ${snapshotPesanan.data![index].jadwal.waktuMulai} - "
                                      "${snapshotPesanan.data![index].jadwal.waktuAkhir}",
                              status: snapshotPesanan.data![index].status,
                            ),
                          ),
                        );
                      }),
                );
        });
  }
}
