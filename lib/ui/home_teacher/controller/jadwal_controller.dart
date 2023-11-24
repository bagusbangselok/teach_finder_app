import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/hari_model.dart';
import 'package:teach_finder_app/models/jadwal_model.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/hari_provider.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/jadwal_provider.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/jenjang_provider.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/mapel_provider.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/tambah_jadwal_provider.dart';

class JadwalController {
  JadwalProvider _jadwalProvider = JadwalProvider();
  MapelProvider _mapelProvider = MapelProvider();
  JenjangProvider _jenjangProvider = JenjangProvider();
  HariProvider _hariProvider = HariProvider();
  TambahJadwalProvider _tambahJadwalProvider = TambahJadwalProvider();

  Future<List<JadwalModel>> getListJadwal() async {
    return await _jadwalProvider.getJadwalGuru();
  }

  Future<List<MataPelajaranModel>> getListMapel() async {
    return await _mapelProvider.getListMapel();
  }

  Future<List<JenjangModel>> getListJenjang() async {
    return await _jenjangProvider.getListJenjang();
  }

  Future<List<HariModel>> getListHari() async {
    return await _hariProvider.getListHari();
  }

  Future<int?> getGuruId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('idGuru');
  }

  Future<dynamic> AddScheduleProcess(
    BuildContext context,
    String name,
    String hariID,
    String? mataPelajaranId,
    String jenjangId,
    String waktuMulai,
    String waktuAkhir,
    int harga,
  ) async {
    final success = await _tambahJadwalProvider.addScheduleProcess(
        context: context,
        name: name,
        hariID: hariID,
        mataPelajaranId: mataPelajaranId,
        jenjangId: jenjangId,
        waktuMulai: waktuMulai,
        waktuAkhir: waktuAkhir,
        harga: harga);
    print('sukses: $success');
    return success;
  }
}
