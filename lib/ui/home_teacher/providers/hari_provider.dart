import 'package:dio/dio.dart';
import 'package:teach_finder_app/models/hari_model.dart';
import 'package:teach_finder_app/res/url.dart';

class HariProvider {
  final Dio _dio = Dio();

  Future<List<HariModel>> getListHari() async {
    final response = await _dio.get(Url.HARI_URL);
    print('dataHari: ${response.data["data"]}');
    print(response.statusCode);

    final list = List<HariModel>.from(
        response.data["data"].map((data) => HariModel.fromJson(data))
    );

    return list;
  }
}