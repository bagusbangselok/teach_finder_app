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

  Future<List<TeacherModel>?> getListProfile() async {
     // return await _service.getTeacher();
  }

  Future<UserModel?> getProfileByToken() async{
    return await _loginProvider.getProfilUser();
  }

  Future<List<PesananModel>> getListPesananGuru() async{
    print("awaittt : ${await _pesananProvider.getPesanan()}");
    return await _pesananProvider.getPesanan();
  }
}