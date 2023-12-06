import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/jadwal_model.dart';

class JadwalProvider {
  final Dio _dio = Dio();

  Future<List<JadwalModel>> getJadwalGuru(int idGuru) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await _dio.get(
        'https://teachfinder.agiftsany-azhar.web.id/api/jadwal/filter-jadwal',
        queryParameters: {
          'guru_id': idGuru.toString()
        }
    );
    print('dataJadwal: ${response.data["data"]}');
    print(response.statusCode);
    print(response.realUri);

    final list = List<JadwalModel>.from(
        response.data["data"].map((data) => JadwalModel.fromJson(data))
    );

    return list;
  }
}