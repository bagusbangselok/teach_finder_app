import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/jadwal_model.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/jadwal_provider.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/jenjang_provider.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/mapel_provider.dart';

class JadwalController {
  JadwalProvider _jadwalProvider = JadwalProvider();
  MapelProvider _mapelProvider = MapelProvider();
  JenjangProvider _jenjangProvider = JenjangProvider();

  Future<List<JadwalModel>> getListJadwal() async{
    return await _jadwalProvider.getJadwalGuru();
  }

  Future<List<MataPelajaranModel>> getListMapel() async{
    return await _mapelProvider.getListMapel();
  }

  Future<List<JenjangModel>> getListJenjang() async{
    return await _jenjangProvider.getListJenjang();
  }

  Future<int?> getGuruId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('idGuru');
  }

}