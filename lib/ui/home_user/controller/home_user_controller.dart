import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/ui/home_user/provider/home_user_provider.dart';

class HomeUserController {
  HomeUserProvider _homeUserProvider = HomeUserProvider();

  Future<List<TeacherModel>> getListPesananGuru() async{
    return await _homeUserProvider.getListGuru();
  }
}