import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/models/lokasi_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/login/login.dart';
import 'package:teach_finder_app/ui/register/providers/register_provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class RegisterController {
  final RegisterProvider _registerProvider = RegisterProvider();


  Future<dynamic> registerTeacherProcess(
      String name,
      String password,
      String confirm_password,
      String email,
      String phone,
      String skl_ijazah,
      String alamat,
      String alamat_id
    ) async {
    final success = await _registerProvider.registerTeacher(
      name: name,
      password: password,
      confirm_password: confirm_password,
      email: email,
      phone: phone,
      skl_ijazah: skl_ijazah,
      alamat: alamat,
      alamat_id: alamat_id,
    );
    print('sukses: $success');
    return success;
  }

  Future<dynamic> registerUserProcess(
      BuildContext context,
      String name,
      String password,
      String confirm_password,
      String email,
      String phone,
      String jenjang_id,
      String alamat,
      ) async {
    final success = await _registerProvider.registerUser(
      name: name,
      password: password,
      confirm_password: confirm_password,
      email: email,
      phone: phone,
      jenjang_id: jenjang_id,
      alamat: alamat,
    );
    if (success != null) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text("Sukses!!!"),
              content: Column(
                children: <Widget>[
                  Image.asset(
                      "assets/icon/success.png",
                    height: 110,
                    width: 110,
                  ),
                  SizedBox(height: 8),
                  Text("Daftar berhasil !!!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      )
                  ),
                  SizedBox(height: 16),
                  Text("Silahkan masuk !!!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      )
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login()
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      padding: EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: primaryColor,
                    ),
                    child: Text(
                      "Selesai",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Daftar gagal. silahkan cek kembali isian anda.',
              style: TextStyle(
                  color: dangerColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
            ),
          )
      );
    }
    print('sukses: $success');
    return success;
  }

  Future<List<JenjangModel>> loadJenjangFromJson() async {
    return await rootBundle.loadString('assets/json/jenjang.json')
        .then((String news) => json.decode(news) as List)
        .then((List value) {
      List<JenjangModel> listJenjang = [];
      value.forEach((index)=> listJenjang.add(JenjangModel.fromJson(index)));
      return listJenjang;
    });
  }

  Future<List<LokasiModel>> loadKecamatanFromJson() async {
    return await rootBundle.loadString('assets/json/kecamatan.json')
        .then((String news) => json.decode(news) as List)
        .then((List value) {
      List<LokasiModel> listKecamatan = [];
      value.forEach((index)=> listKecamatan.add(LokasiModel.fromJson(index)));
      return listKecamatan;
    });
  }

}
