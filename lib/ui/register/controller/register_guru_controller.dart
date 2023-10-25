import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/kecamatan.dart';
import 'package:teach_finder_app/ui/register/providers/register_provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class RegisterGuruController {
  final RegisterProvider _registerProvider = RegisterProvider();


  Future<bool> registerUser(
      String name,
      String password,
      String confirm_password,
      String email,
      String phone,
      String skl_ijazah,
      String alamat,
      String alamat_id
    ) async {
    final success = await _registerProvider.registerUser(
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

  Future<List<Kecamatan>> loadKecamatanFromJson() async {
    return await rootBundle.loadString('assets/json/kecamatan.json')
        .then((String news) => json.decode(news) as List)
        .then((List value) {
      List<Kecamatan> listKecamatan = [];
      value.forEach((index)=> listKecamatan.add(Kecamatan.fromJson(index)));
      return listKecamatan;
    });
  }

}
