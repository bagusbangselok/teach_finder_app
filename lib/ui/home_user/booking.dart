import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/res/responsive.dart';
import 'package:teach_finder_app/ui/home_teacher/controller/profile_teacher_controller.dart';
import 'package:teach_finder_app/ui/home_user/controller/home_user_controller.dart';
import 'package:teach_finder_app/ui/home_user/drawer_user.dart';
import 'package:teach_finder_app/ui/page_not_found/schedule_not_found.dart';
import 'package:teach_finder_app/ui/utils/card_booking_teacher.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _Booking();
}

class _Booking extends State<Booking> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProfileTeacherController _profileTeacherController =
      ProfileTeacherController();
  HomeUserController _homeUserController = HomeUserController();
  bool ShowCardListBooking = true;
  Responsive _responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: DrawerUser(),
        backgroundColor: primaryColor,
        body: FutureBuilder<UserModel?>(
            future: _profileTeacherController.getProfileByToken(),
            builder:
                (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 50.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Halo, ${snapshot.data?.name ?? ''} !!",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(height: 12),
                                      Text(
                                          "Ingin mencari guru private mapel apa ??",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset("assets/illustration/user.png",
                                  height: 100)
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Container list guru private
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                            ListPemesanan(),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  Widget ListPemesanan() {
    return FutureBuilder<List<PesananModel>>(
        future: _homeUserController.getListPesananMurid(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PesananModel>> snapshot) {
          print("psnMurd: ${snapshot}");
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      print("data pesanan siswa : ${snapshot.data}");
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CardListBooking(
                              urlImage: "assets/icon/icon_guru.png",
                              name: "${snapshot.data![index].guru.name}",
                              location:
                                  "${snapshot.data![index].guru.lokasi.name}",
                              subject:
                                  "${snapshot.data![index].guru.mataPelajaran.name}",
                              salary: "${snapshot.data![index].jadwal.harga}",
                              status: "${snapshot.data![index].status}",
                              phone: "${snapshot.data![index].guru.phone}",
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    }),
              );
        });
  }
}
