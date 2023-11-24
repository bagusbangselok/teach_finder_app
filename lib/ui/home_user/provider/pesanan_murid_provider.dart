import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/res/url.dart';

class PesananMuridProvider {
  final Dio _dio = Dio();

  Future<List<PesananModel>> getListPesananMurid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var muridId = await prefs.getInt('idMurid');

    final response = await _dio.get('${Url.PESANAN_BY_MURID}?id=${muridId}');
    print("id murid: ${muridId}");
    print('${Url.PESANAN_BY_MURID}/${muridId}');
    print('dataPesanan: ${response.data["data"]}');
    print(response.statusCode);

    final list = List<PesananModel>.from(
        response.data["data"].map((data) => PesananModel.fromJson(data))
    );

    return list;
  }
}