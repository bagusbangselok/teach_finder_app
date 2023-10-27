import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/res/url.dart';

class PesananProvider {
  final Dio _dio = Dio();

  Future<List<PesananModel>> getPesanan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var guruId = await prefs.getInt('idGuru');
    final response = await _dio.get('${Url.PESANAN_BY_GURU}/${guruId}');
    print('dataPesanan: ${response.data["data"]}');
    print(response.statusCode);
    final list = List<PesananModel>.from(
      response.data["data"].map((data) => PesananModel.fromJson(data))
    );

    // if (response.statusCode == 200) {
    //   if(response.data['success']){
    //     return list;
    //   }
    // }
    return list;
  }
}