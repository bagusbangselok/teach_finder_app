import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/jadwal_model.dart';

class JadwalProvider {
  final Dio _dio = Dio();

  Future<List<JadwalModel>> getJadwalGuru() async {
  final prefs = await SharedPreferences.getInstance();
    final response = await _dio.get(
        'https://teachfinder.agiftsany-azhar.web.id/api/jadwal/filter-jadwal',
      queryParameters: {
          'guru_id': prefs.getInt('idGuru').toString()
      }
    );
    print(response.realUri);
    print('dataPesanan: ${response.data["data"]}');
    print(response.statusCode);

    final list = List<JadwalModel>.from(
        response.data["data"].map((data) => JadwalModel.fromJson(data))
    );

    return list;
  }
}