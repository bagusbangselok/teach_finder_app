import 'package:dio/dio.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/res/url.dart';

class JenjangProvider {
  final Dio _dio = Dio();

  Future<List<JenjangModel>> getListJenjang() async {
    final response = await _dio.get(Url.JENJANG_URL);
    print('dataMapel: ${response.data["data"]}');
    print(response.statusCode);

    final list = List<JenjangModel>.from(
        response.data["data"].map((data) => JenjangModel.fromJson(data))
    );

    return list;
  }
}