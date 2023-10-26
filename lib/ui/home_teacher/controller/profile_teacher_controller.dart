import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/ui/home_teacher/providers/profile_teacher_provider.dart';
import 'package:teach_finder_app/ui/login/providers/login_provider.dart';

class ProfileTeacherController {
  LoginProvider _loginProvider = LoginProvider();
  ProfileTeacherProvider _profileTeacherProvider = ProfileTeacherProvider();


  // final _service = Provider.of<ProfileTeacherProvider>();

  @override
  void initState() {
    // super.initState();
    // _profileTeacherProvider.getListTeacherById(id)
  }

  Future<int> getId() async {
    int savedUserId = await _loginProvider.getProfileId();
    return savedUserId;
  }

  Future<List<TeacherModel>?> getListProfile() async {
     // return await _service.getTeacher();
  }

  Future<TeacherModel?> getProfileById(int id) async{
    // return await _service.getTeacherById(id);
  }
}