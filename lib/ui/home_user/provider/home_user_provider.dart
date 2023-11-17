import 'package:dio/dio.dart';
import 'package:teach_finder_app/models/lokasi_model.dart';
import 'package:teach_finder_app/models/teacher_model.dart';

class HomeUserProvider {
  final Dio _dio = Dio();

  Future<List<LokasiModel>> getListLokasi() async {
    final response =
        await _dio.get('https://teachfinder.agiftsany-azhar.web.id/api/lokasi');
    print('dataPesanan: ${response.data["data"]}');
    print(response.statusCode);

    final list = List<LokasiModel>.from(
        response.data["data"].map((data) => LokasiModel.fromJson(data)));

    return list;
  }

  Future<List<TeacherModel>> getListGuru({
    String? location,
    String? pelajaran,
    String? jenjang,
  }) async {
    final Map<String, dynamic> params = {
      'lokasi_id': location,
      'mata_pelajaran_id': pelajaran,
      'jenjang_id': jenjang,
    };
    final response = await _dio.get(
      'http://192.168.1.15:8000/api/guru/filter-guru',
      queryParameters: params,
    );
    print("params: ${params}");
    print(response.statusCode);
    print("data guruu: ${response.data}");

    final list = List<TeacherModel>.from(
        response.data["data"].map((data) => TeacherModel.fromJson(data)));

    return list;
  }

  Future<List<TeacherModel>> getListPesananGuru() async {
    final response =
        await _dio.get('https://teachfinder.agiftsany-azhar.web.id/api/guru');
    print(response.statusCode);
    print("data guruu: ${response.data}");

    final list = List<TeacherModel>.from(
        response.data["data"].map((data) => TeacherModel.fromJson(data)));

    return list;
  }
}
