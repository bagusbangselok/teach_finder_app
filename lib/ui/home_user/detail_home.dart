import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_user/booking.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';

class DetailHome extends StatelessWidget {
  TeacherModel teacher;
  int? idMurid;

  DetailHome({Key? key, required this.teacher, required this.idMurid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Center(
                  child: Text("Detail Guru Private",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white))),
            ),
            SizedBox(height: 20),
            Center(
                child: Column(
              children: [
                Image.asset("assets/icon/user_icon1.png"),
                SizedBox(height: 12),
                Text(
                  "${teacher.name}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 12),
                // Icon(Icons.star)
              ],
            )),
            Text(
              "${teacher.jadwal[0].name}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            Text(
              "Lokasi Guru",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 14),
            Text(
              "${teacher.lokasi.name}",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Jadwal",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "${teacher.jadwal[0].waktuMulai} - ${teacher.jadwal[0].waktuAkhir}",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Acception(context);
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Text(
                      "Pengajuan",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ))),
          ],
        ),
      ),
    );
  }

  Widget Acception(context) {
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
                      RequestTeacher(
                          idMurid, teacher.id, teacher.jadwal[0].id, context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Finishing(context);
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

  Widget Finishing(context) {
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

  void RequestTeacher(int? muridId, int guruId, int jadwalId, context) async {
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
