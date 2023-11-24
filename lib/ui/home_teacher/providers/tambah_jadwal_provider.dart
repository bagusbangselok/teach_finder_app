import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/res/responsive.dart';
import 'package:teach_finder_app/res/url.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_request.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_schedule.dart';

class TambahJadwalProvider {
  final Dio _dio = Dio();
  Responsive _responsive = Responsive();

  Future<dynamic> addScheduleProcess({
    required BuildContext context,
    required String name,
    required String hariID,
    required String? mataPelajaranId,
    required String jenjangId,
    required String waktuMulai,
    required String waktuAkhir,
    required int harga,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var guruId = await prefs.getInt('idGuru');
    final response = await _dio.post(Url.TAMBAH_JADWAL_URL, data: {
      'name': name,
      'guru_id': guruId,
      'hari_id': hariID,
      'mata_pelajaran_id': mataPelajaranId,
      'jenjang_id': jenjangId,
      'waktu_mulai': waktuMulai,
      'waktu_akhir': waktuAkhir,
      'harga': harga
    });
    print("id guru: ${guruId}");
    print('dataPesanan: ${response.data["data"]}');
    print(response.statusCode);

    if (response.statusCode == 200) {
      if (response.data['success']) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: SizedBox(
                  height: 0.38 * _responsive.screenHeight(context),
                  width: 0.8 * _responsive.screenWidth(context),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/icon/success.png",
                        height: 110,
                        width: 110,
                      ),
                      SizedBox(height: 8),
                      Text("Tambah Jadwal Berhasil !!!",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeTeacherSchedule()),
                            (route) => false,
                          );
                        },
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsetsDirectional.symmetric(
                                    horizontal: 25, vertical: 10)),
                            backgroundColor:
                                MaterialStatePropertyAll(primaryColor),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Text(
                          "Selesai",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10)
                    ],
                  ),
                ),
              );
            });
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            '${response.data['message']}',
            style: TextStyle(
                color: dangerColor, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ));
      }
    } else {
      // Gagal mendaftar
      return false;
    }
  }
}
