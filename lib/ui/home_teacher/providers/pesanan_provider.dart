import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/res/url.dart';

class PesananProvider {
  final Dio _dio = Dio();

  Future<List<PesananModel>> getListPesananMenunggu() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var guruId = await prefs.getInt('idGuru');

    final response = await _dio.get(
      '${Url.PESANAN_BY_GURU}?id=${guruId}&status=0'
    );
    print("id guru: ${guruId}");
    print('${Url.PESANAN_BY_GURU}?id=${guruId}&status=0');
    print('dataPesanan: ${response.data["data"]}');
    print(response.statusCode);


    final list = List<PesananModel>.from(
      response.data["data"].map((data) => PesananModel.fromJson(data))
    );

    return list;
  }

  Future<List<PesananModel>> getListPesananTerima() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var guruId = await prefs.getInt('idGuru');

    final response = await _dio.get(
      '${Url.PESANAN_BY_GURU}?id=${guruId}&status=1'
    );
    print("id guru: ${guruId}");
    print('${Url.PESANAN_BY_GURU}?id=${guruId}&status=0');
    print('dataPesanan: ${response.data["data"]}');
    print(response.statusCode);


    final list = List<PesananModel>.from(
      response.data["data"].map((data) => PesananModel.fromJson(data))
    );

    return list;
  }

  Future<List<PesananModel>> getListPesananTolak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var guruId = await prefs.getInt('idGuru');

    final response = await _dio.get(
      '${Url.PESANAN_BY_GURU}?id=${guruId}&status=2'
    );
    print("id guru: ${guruId}");
    print(response.realUri);
    print('dataPesananTolak: ${response.data["data"]}');
    print(response.statusCode);


    final list = List<PesananModel>.from(
      response.data["data"].map((data) => PesananModel.fromJson(data))
    );

    return list;
  }

  // Future<PesananModel?> getPesananById() async {
  //   try {
  //     final response = await _dio.get(
  //         '${Url.PESANAN_BY_GURU}/${id}',
  //     );
  //     print(response.statusCode);
  //     print("responnya: ${response.data['data']}");
  //     if (response.statusCode == 200) {
  //       print("Berhasil gak");
  //       return PesananModel.fromJson(response.data['data']);
  //     }
  //   } on DioError catch (e) {
  //     print('Error during login: $e');
  //   }
  //   return null;
  // }

}