import 'package:dio/dio.dart';
import 'package:teach_finder_app/models/jadwal_model.dart';

class JadwalProvider {
  final Dio _dio = Dio();

  Future<List<JadwalModel>> getJadwalGuru() async {
    final response = await _dio.get('https://teachfinder.agiftsany-azhar.web.id/api/jadwal/filter-jadwal');
    print('dataPesanan: ${response.data["data"]}');
    print(response.statusCode);

    final list = List<JadwalModel>.from(
        response.data["data"].map((data) => JadwalModel.fromJson(data))
    );

    return list;
  }
}