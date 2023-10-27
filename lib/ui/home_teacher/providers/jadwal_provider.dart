// import 'package:dio/dio.dart';
// import 'package:teach_finder_app/models/jadwal_model.dart';
//
// class JadwalProvider {
//   final Dio _dio = Dio();
//
//   Future<Jadwalmodel?> getJadwalGuru() async {
//     print("object");
//     getAuthToken();
//     print("tokenn : ${getAuthToken()}");
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     try {
//       Options headers = Options(
//           headers: {
//             'Authorization': prefs.getString('authToken'),
//           }
//       );
//       final response = await _dio.get(
//           'https://teachfinder.agiftsany-azhar.web.id/api/user/show',
//           options: headers
//       );
//       print(response.data);
//       print(response.statusCode);
//
//       if (response.statusCode == 200) {
//         print("dataUser: ${response.data['user']}");
//         if(response.data['success']){
//           var json = response.data['User'];
//           print("json: ${json}");
//           return UserModel.fromJson(response.data['User']);
//         }
//       }
//     } on DioError catch (e) {
//       print('Error during login: $e');
//     }
//     return null;
//   }
// }