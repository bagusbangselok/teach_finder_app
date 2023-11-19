import 'package:dio/dio.dart' show Dio, Response;
import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/models/lokasi_model.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
import 'package:teach_finder_app/models/teacher_model.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/controller/profile_teacher_controller.dart';
import 'package:teach_finder_app/ui/home_user/booking.dart';
import 'package:teach_finder_app/ui/home_user/controller/home_user_controller.dart';
import 'package:teach_finder_app/ui/home_user/drawer_user.dart';
import 'package:teach_finder_app/ui/utils/card_list_teacher.dart';

HomeUserController _homeUserController = HomeUserController();

Future<List<LokasiModel>> lokasi = _homeUserController.getListLokasi();
Future<List<MataPelajaranModel>> mapel = _homeUserController.getListMapel();
Future<List<JenjangModel>> jenjang = _homeUserController.getListJenjang();
// Define variables to store selected values
String locationDropdownValue = "";
String pelajaranDropdownValue = "";
String jenjangDropdownValue = "";

String? selectedValue;

final _formKey = GlobalKey<FormState>();

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUser();
}

class _HomeUser extends State<HomeUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProfileTeacherController _profileTeacherController =
      ProfileTeacherController();

  late TeacherModel teacher;
  late List<LokasiModel> lokasiList = [];

  int? idMurid;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        drawer: DrawerUser(),
        backgroundColor: primaryColor,
        body: FutureBuilder<UserModel?>(
            future: _profileTeacherController.getProfileByToken(),
            builder:
                (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 30, // Changing Drawer Icon Size
                                ),
                                onPressed: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                tooltip: MaterialLocalizations.of(context)
                                    .openAppDrawerTooltip,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Image.asset("assets/icon/icon_white.png",
                                    width: 50),
                                borderRadius: BorderRadius.circular(50),
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 40, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Halo, ${snapshot.data?.name ?? ''} !!",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(height: 12),
                                      Text(
                                          "Ingin mencari guru private mapel apa ??",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset("assets/illustration/user.png",
                                  height: 100)
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Container list guru private
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 44),
                        width: double.infinity,
                        height: 640,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            shape: BoxShape.rectangle),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    height: 35,
                                    width: 0.3 * screenWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: blackColor),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on_sharp, size: 18),
                                        SizedBox(width: 5),
                                        FutureBuilder<List<LokasiModel>>(
                                          future: lokasi,
                                          builder: (BuildContext context,
                                              AsyncSnapshot<List<LokasiModel>>
                                                  snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              // Return a loading indicator or an empty widget while data is loading
                                              return CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              // Handle error state
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              List<DropdownMenuItem<String>>
                                                  dropdownItems =
                                                  snapshot.data!.map((lokasi) {
                                                return DropdownMenuItem<String>(
                                                  value: lokasi.id.toString(),
                                                  child: Text(lokasi.name),
                                                );
                                              }).toList();
                                              // Add an item for "All" or an empty string
                                              dropdownItems.insert(
                                                  0,
                                                  DropdownMenuItem<String>(
                                                    value:
                                                        '', // Use an empty string as the value for "All"
                                                    child: Text(
                                                        'All'), // Display "All" as the dropdown item
                                                  ));

                                              return DropdownButton<String>(
                                                underline: Container(),
                                                hint: Text(
                                                  "Lokasi",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                icon: Icon(Icons
                                                    .keyboard_arrow_down_outlined),
                                                items: dropdownItems,
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    locationDropdownValue =
                                                        value!;
                                                  });
                                                },
                                              );
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 0.01 * screenWidth),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    height: 35,
                                    width: 0.3 * screenWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: blackColor),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.account_balance_outlined,
                                            size: 18),
                                        SizedBox(width: 5),
                                        FutureBuilder<List<JenjangModel>>(
                                          future: jenjang,
                                          builder: (BuildContext context,
                                              AsyncSnapshot<List<JenjangModel>>
                                                  snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              // Return a loading indicator or an empty widget while data is loading
                                              return CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              // Handle error state
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              List<DropdownMenuItem<String>>
                                                  dropdownItems =
                                                  snapshot.data!.map((jenjang) {
                                                return DropdownMenuItem<String>(
                                                  value: jenjang.id.toString(),
                                                  child: Text(jenjang.name),
                                                );
                                              }).toList();
                                              // Add an item for "All" or an empty string
                                              dropdownItems.insert(
                                                  0,
                                                  DropdownMenuItem<String>(
                                                    value:
                                                        '', // Use an empty string as the value for "All"
                                                    child: Text(
                                                        'All'), // Display "All" as the dropdown item
                                                  ));

                                              return DropdownButton<String>(
                                                underline: Container(),
                                                hint: Text(
                                                  "Jenjang",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                icon: Icon(Icons
                                                    .keyboard_arrow_down_outlined),
                                                items: dropdownItems,
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    jenjangDropdownValue =
                                                        value!;
                                                  });
                                                },
                                              );
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 0.01 * screenWidth),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    height: 35,
                                    width: 0.3 * screenWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: blackColor),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.menu_book, size: 18),
                                        SizedBox(width: 5),
                                        FutureBuilder<List<MataPelajaranModel>>(
                                          future: mapel,
                                          builder: (BuildContext context,
                                              AsyncSnapshot<
                                                      List<MataPelajaranModel>>
                                                  snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              // Return a loading indicator or an empty widget while data is loading
                                              return CircularProgressIndicator();
                                            } else if (snapshot.hasError) {
                                              // Handle error state
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              List<DropdownMenuItem<String>>
                                                  dropdownItems =
                                                  snapshot.data!.map((mapel) {
                                                return DropdownMenuItem<String>(
                                                  value: mapel.id.toString(),
                                                  child: Text(mapel.name),
                                                );
                                              }).toList();
                                              // Add an item for "All" or an empty string
                                              dropdownItems.insert(
                                                  0,
                                                  DropdownMenuItem<String>(
                                                    value:
                                                        '', // Use an empty string as the value for "All"
                                                    child: Text(
                                                        'All'), // Display "All" as the dropdown item
                                                  ));

                                              return DropdownButton<String>(
                                                underline: Container(),
                                                hint: Text(
                                                  "Pelajaran",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                icon: Icon(Icons
                                                    .keyboard_arrow_down_outlined),
                                                items: dropdownItems,
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    jenjangDropdownValue =
                                                        value!;
                                                  });
                                                },
                                              );
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24),
                            Expanded(
                              child: ListGuru(
                                idMurid: snapshot.data?.murid?.id,
                                location: locationDropdownValue,
                                pelajaran: pelajaranDropdownValue,
                                jenjang: jenjangDropdownValue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  Widget ListGuru(
      {int? idMurid, String? location, String? pelajaran, String? jenjang}) {
    print("halo bagong");
    return FutureBuilder<List<TeacherModel>?>(
        future: _homeUserController.getListGuru(
          location: location,
          pelajaran: pelajaran,
          jenjang: jenjang,
        ),
        builder: (BuildContext context,
            AsyncSnapshot<List<TeacherModel>?> snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _displayBottomSheet(
                                context, idMurid, snapshot.data![index]);
                          },
                          child: CardListTeacher(
                            urlImage: "assets/icon/user_icon1.png",
                            name: "${snapshot.data?[index].name}",
                            location: "${snapshot.data?[index].lokasi.name}",
                            subject:
                                "${(snapshot.data?[index].jadwal.length ?? 0) > 0 ? (snapshot.data?[index].jadwal[0].name) : '-'}",
                            salary:
                                "${(snapshot.data?[index].jadwal.length ?? 0) > 0 ? (snapshot.data?[index].jadwal[0].harga) : '-'}",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  });
        });
  }

  Future<void> _displayBottomSheet(
      BuildContext context, int? idMurid, TeacherModel teacher) async {
    await showModalBottomSheet(
      context: context,
      barrierColor: blackColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Detail Guru Private",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: Image.asset("assets/icon/user_icon1.png"),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "${teacher.name}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deskripsi :",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${teacher.jadwal[0].name}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Lokasi Guru",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${teacher.lokasi.name}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Jadwal : ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Text(
                        "${teacher.jadwal[0].waktuMulai} - ${teacher.jadwal[0].waktuAkhir}"),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Acception(context);
                              });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: Text(
                          "Pengajuan",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ))),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget Acception(context) {
    return AlertDialog(
      title: Text("Peringatan!!", textAlign: TextAlign.center),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      content: SizedBox(
        height: 152,
        width: 292,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Apakah anda yakin ingin meminta guru tersebut untuk menjadi gurumu ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsetsDirectional.symmetric(
                                horizontal: 25, vertical: 10)),
                        backgroundColor: MaterialStatePropertyAll(dangerColor),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Tidak",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: whiteColor))),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsetsDirectional.symmetric(
                                horizontal: 25, vertical: 10)),
                        backgroundColor: MaterialStatePropertyAll(primaryColor),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      Navigator.of(context).pop();
                      RequestTeacher(
                          idMurid, teacher.id, teacher.jadwal[0].id, context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Finishing(context);
                          });
                    },
                    child: Text("Yakin",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: whiteColor))),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Finishing(context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      content: SizedBox(
        height: 342,
        width: 292,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icon/success.png", height: 110),
            SizedBox(height: 8),
            Text("Berhasil !!",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 46),
            Flexible(
                child: Text(
              "Sukses meminta kepada guru tersebut. Mohon ditunggu hingga guru tersebut menyetujui",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            )),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Booking()),
                    );
                  },
                  child: Text("Selesai",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: whiteColor))),
            )
          ],
        ),
      ),
    );
  }

  void RequestTeacher(int? muridId, int guruId, int jadwalId, context) async {
    Dio dio = Dio();

    // Define the API endpoint and request data
    String apiUrl =
        'https://teachfinder.agiftsany-azhar.web.id/api/pesanan/store';
    Map<String, dynamic> postData = {
      'murid_id': muridId,
      'guru_id': guruId,
      'jadwal_id': jadwalId
    };

    try {
      Response response = await dio.post(apiUrl, data: postData);

      if (response.statusCode == 200) {
        // Request was successful
        if (response.data['success']) {
          print("Sukses Memesan");
        }
        print('Response data: ${response.data}');
      } else {
        // Handle errors
        print(
            'Failed to make the POST request. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or request errors
      print('Error: $error');
    }
  }
}
