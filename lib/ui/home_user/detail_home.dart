import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/jadwal_model.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_user/booking.dart';
import 'package:teach_finder_app/ui/home_user/controller/home_user_controller.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';
import 'package:teach_finder_app/ui/utils/card_jadwal.dart';

int selectedIndex = -1;
// List<Map<String, dynamic>> listJadwal = [
//   {
//     'isChecked': true,
//     'hari': 'Senin',
//     'time': '08.00 - 11.00',
//   },
//   {
//     'isChecked': false,
//     'hari': 'Selasa',
//     'time': '10.00 - 11.00',
//   },
//   {
//     'isChecked': false,
//     'hari': 'Rabu',
//     'time': '10.00 - 11.00',
//   },
// ];

class DetailHome extends StatefulWidget {
  final TeacherModel? teacher;
  final int? idMurid;
  final int? idGuru;
  DetailHome({Key? key, required this.teacher, required this.idMurid, required this.idGuru}) : super(key: key);

  @override
  State<DetailHome> createState() => _DetailHome(teacher: teacher, idMurid: idMurid, idGuru: idGuru);
}

class _DetailHome extends State<DetailHome> {
  TeacherModel? teacher;
  int? idMurid;
  int? idGuru;

  _DetailHome({Key? key, required this.teacher, required this.idMurid, required this.idGuru})
      : super();
  HomeUserController _homeUserController = HomeUserController();
  List<Map<String, dynamic>> listJadwal = [];
  int? getSelectedId() {
    for (var jadwal in listJadwal) {
      if (jadwal['isChecked'] == true) {
        return jadwal['id'];
      }
    }
    return null; // Return null if no item is selected
  }
  @override
  Widget build(BuildContext context) {
    print("id terpilih : ${getSelectedId()}");
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(28)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text("Detail Guru Private",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: whiteColor,
                          ))
                    ])
                  ],
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/icon/guru_male.png",
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      teacher!.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              SizedBox(height: 24),
          FutureBuilder(
            future: _homeUserController.getListJadwal(idGuru!),
            builder: (BuildContext context, AsyncSnapshot<List<JadwalModel>> snapshotJadwal) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deskripsi :",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${teacher?.description ?? '-'}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Pilih Mata Pelajaran : ",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    !snapshotJadwal.hasData
                        ? Center(child: CircularProgressIndicator())
                        : snapshotJadwal.data!.isEmpty
                        ? Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text("Guru belum membuat jadwal"),
                      ),
                    )
                        : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                        itemCount: snapshotJadwal.data?.length,
                        itemBuilder: (context, index) {
                          listJadwal.add({
                            'isChecked': false,
                            'id': snapshotJadwal.data![index].id,
                            'day': snapshotJadwal
                                .data![index].hari.name,
                            'time_start': snapshotJadwal
                                .data![index].waktuMulai,
                            'time_end': snapshotJadwal
                                .data![index].waktuAkhir
                          });
                          final jadwal = listJadwal[index];
                          return CardJadwal(
                            isChecked: jadwal['isChecked'] ?? false,
                            hari: jadwal['day'] ?? '',
                            time_start: jadwal['time_start'] ?? '',
                            time_end: jadwal['time_end'] ?? '',
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                for (int i = 0; i < listJadwal.length; i++) {
                                  listJadwal[i]['isChecked'] = (i == index);
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    snapshotJadwal.data!.isEmpty
                        ? Center(
                      child: Text(""),
                    )
                        : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          int? selectedId = getSelectedId();
                          print("id dikirim : ${selectedId}");
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Acception(context, idMurid, idGuru, selectedId);
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Pengajuan",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
          ],
          ),
        ),
      ),
    );
  }

  Widget Acception(context, int? muridId, int? guruId, int? jadwalId) {
    return AlertDialog(
      title: Text("Peringatan!!", textAlign: TextAlign.center),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      content: SizedBox(
        height: 152,
        width: 292,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Apakah anda yakin ingin meminta guru tersebut untuk menjadi gurumu ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsetsDirectional.symmetric(
                                horizontal: 25, vertical: 10)),
                        backgroundColor: MaterialStatePropertyAll(dangerColor),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Tidak",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: whiteColor))),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsetsDirectional.symmetric(
                                horizontal: 25, vertical: 10)),
                        backgroundColor: MaterialStatePropertyAll(primaryColor),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // RequestTeacher(
                      //     idMurid, teacher.id, teacher.jadwal[0].id, context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Finishing(context, muridId, guruId, jadwalId);
                          });
                    },
                    child: Text("Yakin",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: whiteColor))),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Finishing(context, int? muridId, int? guruId, int? jadwalId) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      content: SizedBox(
        height: 342,
        width: 292,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icon/success.png", height: 110),
            SizedBox(height: 8),
            Text("Berhasil !!",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 46),
            Flexible(
                child: Text(
              "Sukses meminta kepada guru tersebut. Mohon ditunggu hingga guru tersebut menyetujui",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            )),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Booking()),
                    );
                    RequestTeacher(muridId, guruId, jadwalId, context);
                  },
                  child: Text("Selesai",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: whiteColor))),
            )
          ],
        ),
      ),
    );
  }

  void RequestTeacher(int? muridId, int? guruId, int? jadwalId, context) async {
    Dio dio = Dio();

    // Define the API endpoint and request data
    String apiUrl =
        'https://teachfinder.agiftsany-azhar.web.id/api/pesanan/store';
    Map<String, dynamic> postData = {
      'murid_id': muridId,
      'guru_id': guruId,
      'jadwal_id': jadwalId
    };

    try {
      Response response = await dio.post(apiUrl, data: postData);

      if (response.statusCode == 200) {
        print(postData);
        // Request was successful
        if (response.data['success']) {
          print("Sukses Memesan");
        }
        print('Response data: ${response.data}');
      } else {
        // Handle errors
        print(
            'Failed to make the POST request. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or request errors
      print('Error: $error');
    }
  }
}
