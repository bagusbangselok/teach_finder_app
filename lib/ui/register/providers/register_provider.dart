import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/models/lokasi_model.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/res/responsive.dart';
import 'package:teach_finder_app/res/url.dart';
import 'package:teach_finder_app/ui/login/login.dart';

class RegisterProvider {
  final Dio _dio = Dio();
  Responsive _responsive = Responsive();

  Future<dynamic> registerTeacher({
    required BuildContext context,
    required String name,
    required String password,
    required String confirm_password,
    required String email,
    required String phone,
    required String mataPelajaran,
    required String filePath,
    required String fileName,
    required String alamat,
    required String lokasi_id
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'password': password,
        'confirm_password': confirm_password,
        'email': email,
        'role_id': 2,
        'phone': phone,
        'mata_pelajaran_id': mataPelajaran,
        'skl_ijazah': await MultipartFile.fromFile(
          filePath,
          filename: fileName,
        ),
        'alamat': alamat,
        'lokasi_id': lokasi_id
      });

      final response = await _dio.post(Url.REGISTER_USER, data: formData);



      print(name);
      print(password);
      print(confirm_password);
      print(email);
      print(phone);
      print(filePath);
      print(fileName);
      print(alamat);
      print(lokasi_id);
      print("pesan: ${response.data['message']}");
      if (response.statusCode == 200) {
        if(response.data['success']){
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  content: SizedBox(
                    height: 0.38 * _responsive.screenHeight(context),
                    width: 0.8 * _responsive.screenWidth(context),
                    child: Flexible(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/icon/success.png",
                            height: 110,
                            width: 110,
                          ),
                          SizedBox(height: 8),
                          Text("Daftar berhasil !!!",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(height: 16),
                          Text("Silahkan cek verifikasi email kalian di email !!!",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsetsDirectional.symmetric(
                                        horizontal: 25, vertical: 10)),
                                backgroundColor: MaterialStatePropertyAll(primaryColor),
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
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
                  ),
                );
              });
        }
        else {
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
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

  Future<dynamic> registerUser({
    required BuildContext context,
    required String name,
    required String password,
    required String confirm_password,
    required String email,
    required String phone,
    required String jenjang_id,
    required String alamat,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'password': password,
        'confirm_password': confirm_password,
        'email': email,
        'role_id': 3,
        'phone': phone,
        'jenjang_id': jenjang_id,
        'alamat': alamat,
      });
      final response = await _dio.post(Url.REGISTER_USER, data: formData);

        print(response.data['message']);
      if (response.statusCode == 200) {
        if(response.data['success']){
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  content: SizedBox(
                    height: 0.38 * _responsive.screenHeight(context),
                    width: 0.8 * _responsive.screenWidth(context),
                    child: Flexible(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/icon/success.png",
                            height: 110,
                            width: 110,
                          ),
                          SizedBox(height: 8),
                          Text("Daftar berhasil !!!",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(height: 16),
                          Text("Silahkan cek verifikasi email kalian di email !!!",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsetsDirectional.symmetric(
                                        horizontal: 25, vertical: 10)),
                                backgroundColor: MaterialStatePropertyAll(primaryColor),
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
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
                  ),
                );
              });
        }
        else {
          return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              '${response.data['message']}',
              style: TextStyle(
                  color: dangerColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ));
        }
      } else {
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

  Future<List<JenjangModel>> getListJenjang() async {
    final response = await _dio.get(Url.JENJANG_URL);

    final list = List<JenjangModel>.from(
        response.data["data"].map((data) => JenjangModel.fromJson(data))
    );

    return list;
  }

  Future<List<LokasiModel>> getListKecamatan() async {
    final response = await _dio.get(Url.LOKASI_URL);

    final list = List<LokasiModel>.from(
        response.data["data"].map((data) => LokasiModel.fromJson(data))
    );

    return list;
  }

  Future<List<MataPelajaranModel>> getListMapel() async {
    final response = await _dio.get(Url.MAPEL_URL);

    final list = List<MataPelajaranModel>.from(
        response.data["data"].map((data) => MataPelajaranModel.fromJson(data))
    );

    return list;
  }
}
