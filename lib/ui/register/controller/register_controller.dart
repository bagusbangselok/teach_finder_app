import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/models/lokasi_model.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/register/providers/register_provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class RegisterController {
  final RegisterProvider _registerProvider = RegisterProvider();

  Future<dynamic> registerTeacherProcess(
      BuildContext context,
      String name,
      String password,
      String confirm_password,
      String email,
      String phone,
      String mataPelajaran,
      String filePath,
      String fileName,
      String alamat,
      String lokasi_id
    ) async {
    final success = await _registerProvider.registerTeacher(
      context: context,
      name: name,
      password: password,
      confirm_password: confirm_password,
      email: email,
      phone: phone,
      mataPelajaran: mataPelajaran,
      filePath: filePath,
      fileName: fileName,
      alamat: alamat,
      lokasi_id: lokasi_id,
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
      context: context,
      name: name,
      password: password,
      confirm_password: confirm_password,
      email: email,
      phone: phone,
      jenjang_id: jenjang_id,
      alamat: alamat,
    );
    if (success == true){
      return success;
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Ada kesalahan",
          style: TextStyle(
              color: dangerColor, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ));
    }
  }

  Future<List<JenjangModel>> getListJenjang() async {
    return await _registerProvider.getListJenjang();
  }

  Future<List<LokasiModel>> getListKecamatan() async {
    return await _registerProvider.getListKecamatan();
  }

  Future<List<MataPelajaranModel>> getListMapel() async {
    return await _registerProvider.getListMapel();
  }

  Future<List<LokasiModel>> loadKecamatanFromJson() async {
    return await rootBundle
        .loadString('assets/json/kecamatan.json')
        .then((String news) => json.decode(news) as List)
        .then((List value) {
      List<LokasiModel> listKecamatan = [];
      value.forEach((index) => listKecamatan.add(LokasiModel.fromJson(index)));
      return listKecamatan;
    });
  }
}
