class Url {
  Url._();

  static const BASE_URL = 'https://teachfinder.agiftsany-azhar.web.id/api';
  static const USER_URL_BY_TOKEN = '$BASE_URL/user/show';
  static const PESANAN_URL = '$BASE_URL/pesanan';
  static const PESANAN_BY_GURU = '$PESANAN_URL/pesanan-guru';
  static const PESANAN_BY_MURID = '$PESANAN_URL/pesanan-siswa';
  static const JADWAL_BY_GURU = '$BASE_URL/jadwal/show';
  static const REGISTER_USER = '$BASE_URL/user/register';
  static const JENJANG_URL = '$BASE_URL/jenjang';
  static const LOKASI_URL = '$BASE_URL/lokasi';
}
