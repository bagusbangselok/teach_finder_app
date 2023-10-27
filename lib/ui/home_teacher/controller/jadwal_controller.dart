import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/jadwal_model.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/jadwal_provider.dart';

class JadwalController {
  JadwalProvider _jadwalProvider = JadwalProvider();

  Future<List<JadwalModel>?> getListJadwal() async{
    return await _jadwalProvider.getJadwalGuru();
  }

  Future<int?> getGuruId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('idGuru');
  }
}