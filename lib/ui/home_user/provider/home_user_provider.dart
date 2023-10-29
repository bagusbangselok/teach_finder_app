import 'package:dio/dio.dart';
import 'package:teach_finder_app/models/teacher_model.dart';

class HomeUserProvider {
  final Dio _dio = Dio();

  Future<List<TeacherModel>> getListGuru() async {
    final response = await _dio.get('https://teachfinder.agiftsany-azhar.web.id/api/guru');
    print(response.statusCode);
    print("data guruu: ${response.data}");

    final list = List<TeacherModel>.from(
        response.data["data"].map((data) => TeacherModel.fromJson(data))
    );

    return list;
  }
}