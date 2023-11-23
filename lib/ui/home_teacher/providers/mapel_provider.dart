import 'package:dio/dio.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
import 'package:teach_finder_app/res/url.dart';

class MapelProvider {
  final Dio _dio = Dio();

  Future<List<MataPelajaranModel>> getListMapel() async {
    final response = await _dio.get(Url.MAPEL_URL);
    print('dataMapel: ${response.data["data"]}');
    print(response.statusCode);

    final list = List<MataPelajaranModel>.from(
        response.data["data"].map((data) => MataPelajaranModel.fromJson(data))
    );

    return list;
  }
}