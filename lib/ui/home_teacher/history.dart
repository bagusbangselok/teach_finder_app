import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/controller/profile_teacher_controller.dart';
import 'package:teach_finder_app/ui/page_not_found/history_not_found.dart';
import 'package:teach_finder_app/ui/utils/card_history_user.dart';

// Operasi statis boolean tampil atau hide data

class TolakContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HistoryNotFound();
  }
}

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  ProfileTeacherController _profileTeacherController =
      ProfileTeacherController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text(
                  "History",
                  style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                      fontWeight: FontWeight.w700),
                ),
                centerTitle: true,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "Terima",
                    ),
                    Tab(text: "Tolak"),
                  ],
                )),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              child: TabBarView(
                children: [
                  // Terima
                  FutureBuilder<List<PesananModel>>(
                      future:
                          _profileTeacherController.getListPesananTerimaGuru(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<PesananModel>>
                              snapshotPesananTerima) {
                        print("snapterima: ${snapshotPesananTerima}");
                        return !snapshotPesananTerima.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : snapshotPesananTerima.data!.isEmpty
                                ? Center(
                                    child: HistoryNotFound(),
                                  )
                                : ListView.builder(
                                    itemCount:
                                        snapshotPesananTerima.data?.length,
                                    itemBuilder: (context, index) {
                                      print(
                                          "ada data ? : ${snapshotPesananTerima.hasData}");
                                      return Column(
                                        children: [
                                          CardHistoryUser(
                                              urlImage:
                                                  "assets/icon/user_icon1.png",
                                              name: snapshotPesananTerima
                                                  .data![index].murid.name,
                                              level: snapshotPesananTerima
                                                  .data![index]
                                                  .murid
                                                  .jenjang
                                                  .name,
                                              time:
                                                  "${snapshotPesananTerima.data![index].jadwal.hari.name}, ${snapshotPesananTerima.data![index].jadwal.waktuMulai} - ${snapshotPesananTerima.data![index].jadwal.waktuAkhir} WIB",
                                              subject: snapshotPesananTerima
                                                  .data![index]
                                                  .guru
                                                  .mataPelajaran
                                                  .name,
                                              status: snapshotPesananTerima
                                                  .data![index].status),
                                          SizedBox(height: 4),
                                        ],
                                      );
                                    });
                      }),

                  // Tolak
                  FutureBuilder<List<PesananModel>>(
                      future:
                          _profileTeacherController.getListPesananTolakGuru(),
                      builder: (context,
                          AsyncSnapshot<List<PesananModel>>
                              snapshotTolakPesanan) {
                        print(snapshotTolakPesanan);
                        print("data tolak ? : ${snapshotTolakPesanan.hasData}");
                        print("panjang: ${snapshotTolakPesanan.data?.length}");
                        return !snapshotTolakPesanan.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : snapshotTolakPesanan.data!.isEmpty
                                ? Center(
                                    child: HistoryNotFound(),
                                  )
                                : ListView.builder(
                                    itemCount:
                                        snapshotTolakPesanan.data?.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          CardHistoryUser(
                                              urlImage:
                                                  "assets/icon/user_icon1.png",
                                              name: snapshotTolakPesanan
                                                  .data![index].murid.name,
                                              level: snapshotTolakPesanan
                                                  .data![index]
                                                  .murid
                                                  .jenjang
                                                  .name,
                                              time: "${snapshotTolakPesanan.data![index].jadwal.hari.name}," +
                                                  "${snapshotTolakPesanan.data![index].jadwal.waktuMulai}" +
                                                  "- ${snapshotTolakPesanan.data![index].jadwal.waktuAkhir} WIB",
                                              subject: snapshotTolakPesanan
                                                  .data![index]
                                                  .guru
                                                  .mataPelajaran
                                                  .name,
                                              status: snapshotTolakPesanan
                                                  .data![index].status),
                                          SizedBox(height: 4),
                                        ],
                                      );
                                    });
                      }),
                ],
              ),
            )));
  }
}
