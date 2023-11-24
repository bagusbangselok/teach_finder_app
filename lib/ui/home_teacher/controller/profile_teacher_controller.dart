import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/pesanan_provider.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/profile_teacher_provider.dart';
import 'package:teach_finder_app/ui/login/providers/login_provider.dart';

class ProfileTeacherController {
  LoginProvider _loginProvider = LoginProvider();
  PesananProvider _pesananProvider = PesananProvider();
  ProfileTeacherProvider _profileTeacherProvider = ProfileTeacherProvider();

  // final _service = Provider.of<ProfileTeacherProvider>();

  Future<String?> getProfileId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('profileId');
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('username');
    return username;
  }

  Future<UserModel?> getProfileByToken() async {
    return await _loginProvider.getProfilUser();
  }

  Future<dynamic> ignoreRequest(int idPesanan, String description, context) async {
    print("idpsnCtrl: ${idPesanan}");
    final ignoreProcess = await _profileTeacherProvider.IgnoreRequest(idPesanan, description, context);
    return ignoreProcess;
  }

  Future<List<PesananModel>> getListPesananMenungguGuru() async {
    return await _pesananProvider.getListPesananMenunggu();
  }

  Future<List<PesananModel>> getListPesananTerimaGuru() async {
    return await _pesananProvider.getListPesananTerima();
  }

  Future<List<PesananModel>> getListPesananTolakGuru() async {
    return await _pesananProvider.getListPesananTolak();
  }
}