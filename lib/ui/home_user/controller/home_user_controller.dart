import 'package:teach_finder_app/models/pesanan_model.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/ui/home_user/provider/home_user_provider.dart';
import 'package:teach_finder_app/ui/home_user/provider/pesanan_murid_provider.dart';

class HomeUserController {
  HomeUserProvider _homeUserProvider = HomeUserProvider();
  PesananMuridProvider _pesananMuridProvider = PesananMuridProvider();

  Future<List<TeacherModel>> getListPesananGuru() async{
    return await _homeUserProvider.getListGuru();
  }

  Future<List<PesananModel>> getListPesananMurid() async{
    return await _pesananMuridProvider.getListPesananMurid();
  }
}