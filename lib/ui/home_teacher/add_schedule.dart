import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';
import 'package:teach_finder_app/models/hari_model.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
import 'package:teach_finder_app/models/user_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/controller/jadwal_controller.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_schedule.dart';
import 'package:teach_finder_app/ui/utils/money_formatter.dart';

class AddSchedule extends StatefulWidget {
  final UserModel userModel;

  AddSchedule({Key? key, required this.userModel}) : super(key: key);

  @override
  _AddScheduleState createState() => _AddScheduleState(userModel: userModel);
}

class _AddScheduleState extends State<AddSchedule> {
  final UserModel userModel;

  _AddScheduleState({required this.userModel}) : super();
  final TextEditingController _mapelController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  JadwalController _jadwalController = JadwalController();
  final _formKey = GlobalKey<FormState>();

  Widget FormNama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Nama Jadwal",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "Nama tidak boleh kosong";
            }
          },
          controller: _nameController,
          decoration: InputDecoration(
            hintText: "Masukkan Nama Jadwal",
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }

  Widget FormMataPelajaran() {
    print("Usermodel: ${userModel.guru!.mataPelajaranId}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nama Mata Pelajaran",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        FutureBuilder(
            future: _jadwalController.getListMapel(),
            builder: (BuildContext context,
                AsyncSnapshot<List<MataPelajaranModel>> snapshotMapel) {
              return TextFormField(
                controller: _mapelController,
                enabled: false,
              );
            }),
        SizedBox(height: 20),
      ],
    );
  }

  String dropdownvalueHari = 'Pilih Hari';
  List<String> Hari = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu'
  ];

  Widget FormHari() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hari",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        FutureBuilder<List<HariModel>>(
            future: _jadwalController.getListHari(),
            builder: (BuildContext context,
                AsyncSnapshot<List<HariModel>> snapshotHari) {
              return DropdownButtonFormField<String>(
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Harap pilh hari";
                  }
                },
                isExpanded: true,
                hint: Text("Pilih Hari"),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: snapshotHari.data?.map((hari) {
                  return DropdownMenuItem(
                    value: hari.id.toString(),
                    child: Text(hari.name),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalueHari = newValue!;
                  });
                },
                decoration: InputDecoration(border: UnderlineInputBorder()),
              );
            }),
        SizedBox(height: 20),
      ],
    );
  }

  final TextEditingController _earlyTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  TimeOfDay? _selectedEarlyTime;
  TimeOfDay? _selectedEndTime;

  Future<void> _selectEarlyTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedEarlyTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedEarlyTime) {
      setState(() {
        _selectedEarlyTime = picked;
        _earlyTimeController.text = picked.format(context);
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedEndTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedEndTime) {
      setState(() {
        _selectedEndTime = picked;
        _endTimeController.text = picked.format(context);
      });
    }
  }

  @override
  void dispose() {
    _earlyTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  Widget FormWaktuAwal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Waktu Awal",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Harap masukkan waktu awal";
            }
          },
          readOnly: true,
          controller: _earlyTimeController,
          decoration: InputDecoration(
            hintText: "Tentukan Waktu Awal",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: blackColor, width: 1.0),
            ),
          ),
          onTap: () {
            _selectEarlyTime(context);
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget FormWaktuSelesai() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Waktu Akhir",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Harap masukkan waktu akhir";
            }
          },
          readOnly: true,
          controller: _endTimeController,
          decoration: InputDecoration(
            hintText: "Tentukan Waktu Akhir",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: blackColor, width: 1.0),
            ),
          ),
          onTap: () {
            _selectEndTime(context);
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  String dropdownvalueJenjang = 'Pilih Jenjang Pendidikan';
  List<String> Jenjang = ['Pilih Jenjang Pendidikan', 'SD', 'SMP', 'SMA'];

  Widget FormJenjang() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jenjang Pendidikan",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        FutureBuilder(
            future: _jadwalController.getListJenjang(),
            builder:
                (context, AsyncSnapshot<List<JenjangModel>> snapshotJenjang) {
              return DropdownButtonFormField<String>(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Harap pilih jenjang";
                    }
                  },
                  isExpanded: true,
                  hint: Text("Pilih Jenjang"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: snapshotJenjang.data?.map((jenjang) {
                    return DropdownMenuItem(
                      value: jenjang.id.toString(),
                      child: Text(jenjang.name),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalueJenjang = newValue!;
                    });
                  },
                  decoration: InputDecoration(border: UnderlineInputBorder()));
            }),
        SizedBox(height: 20),
      ],
    );
  }

  int? hargaToInteger(){
    var harga = int.parse(_salaryController.text);
    assert(harga is int);
    return harga;
  }

  String _formattedMoney = '';

  void updateFormattedMoney(String value) {
    double amount = double.tryParse(value) ?? 0.0;

    setState(() {
      _formattedMoney = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(amount);
    });
  }

  Widget FormHarga() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Harga (per jam)",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Harap masukkan harga";
            }
          },
          inputFormatters: [],
          controller: _salaryController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: "Rp ",
            suffixText: " / Jam",
            hintText: "Masukkan Harga/Jam",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: blackColor, width: 1.0),
            ),
          ),
          onChanged: (value) {
            updateFormattedMoney(value);
          },
        ),
        SizedBox(height: 4),
        Text(_formattedMoney),
        SizedBox(height: 20),
      ],
    );
  }

  // String formatMoney(double money) {
  //   String formatted = NumberFormat.currency(locale: 'id_ID', symbol: '').format(money);
  //   return formatted.replaceAll('.', ''); // Menghapus titik sebagai pemisah ribuan
  // }

  Widget SimpanBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // var hargaToDouble = double.parse(_salaryController.text);
          // assert(hargaToDouble is double);
          // var hargaFormat = formatMoney(hargaToDouble);
          // var harga = int.parse(_salaryController.text);
          // assert(harga is int);
          // print("harga: ${harga}");
          if (_formKey.currentState!.validate()) {
            _jadwalController.AddScheduleProcess(
                context,
                _nameController.text,
                dropdownvalueHari,
                userModel.guru?.mataPelajaranId,
                dropdownvalueJenjang,
                _earlyTimeController.text,
                _endTimeController.text,
                hargaToInteger()!);
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          primary: primaryColor,
        ),
        child: Text(
          'Simpan',
          style: TextStyle(
              color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.00, vertical: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: blackColor,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Tambah Jadwal Mengajar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        // FormMataPelajaran(),
                        FormNama(),
                        FormHari(),
                        FormWaktuAwal(),
                        FormWaktuSelesai(),
                        FormJenjang(),
                        FormHarga(),
                        SimpanBtn()
                      ]),
                ))));
  }
}
