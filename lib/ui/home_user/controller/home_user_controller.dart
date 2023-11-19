import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/models/lokasi_model.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/ui/home_user/provider/home_user_provider.dart';
import 'package:teach_finder_app/ui/home_user/provider/pesanan_murid_provider.dart';

class HomeUserController {
  HomeUserProvider _homeUserProvider = HomeUserProvider();
  PesananMuridProvider _pesananMuridProvider = PesananMuridProvider();

  Future<List<LokasiModel>> getListLokasi() async {
    return await _homeUserProvider.getListLokasi();
  }

  Future<List<MataPelajaranModel>> getListMapel() async {
    return await _homeUserProvider.getListMapel();
  }

  Future<List<JenjangModel>> getListJenjang() async {
    return await _homeUserProvider.getListJenjang();
  }

  Future<List<TeacherModel>> getListGuru(
      {String? location, String? pelajaran, String? jenjang}) async {
    return await _homeUserProvider.getListGuru(
        location: location, pelajaran: pelajaran, jenjang: jenjang);
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

  Future<List<TeacherModel>> getListPesananGuru() async {
    return await _homeUserProvider.getListPesananGuru();
  }

  Future<List<PesananModel>> getListPesananMurid() async {
    return await _pesananMuridProvider.getListPesananMurid();
  }
}
