import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/controller/jadwal_controller.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_schedule.dart';

class AddSchedule extends StatefulWidget {
  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  JadwalController _jadwalController = JadwalController();
  String dropdownvalueMapel = '';
  List<String> MataPelajaran = ['Pilih Mata Pelajaran', 'Matematika'];
  Widget FormMataPelajaran() {
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
          builder: (BuildContext context, AsyncSnapshot<List<MataPelajaranModel>> snapshotMapel) {
            return DropdownButtonFormField<String>(
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              hint: Text("Pilih Mata Pelajaran"),
              items: snapshotMapel.data?.map((mapel) {
                return DropdownMenuItem(
                  value: mapel.id.toString(),
                  child: Text(mapel.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalueMapel = newValue!;
                });
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder()
              ),
            );
          }
        ),
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
        DropdownButtonFormField(
          isExpanded: true,
          value: dropdownvalueHari,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: Hari.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalueHari = newValue!;
            });
          },
          decoration: InputDecoration(
            border: UnderlineInputBorder()
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  final TextEditingController _timeController = TextEditingController();
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  Widget FormWaktu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Waktu",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          readOnly: true,
          controller: _timeController,
          decoration: InputDecoration(
            hintText: "Pilih Waktu",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: blackColor, width: 1.0),
            ),
          ),
          onTap: () {
            _selectTime(context);
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
          builder: (context, AsyncSnapshot<List<JenjangModel>> snapshotJenjang) {
            return DropdownButtonFormField<String>(
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
                decoration: InputDecoration(
                  border: UnderlineInputBorder()
                ));
          }
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget FormHarga() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Harga / Jam",
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: "Masukkan Harga/Jam",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: blackColor, width: 1.0),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget SimpanBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeTeacherSchedule()));
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
                    FormMataPelajaran(),
                    FormHari(),
                    FormWaktu(),
                    FormJenjang(),
                    FormHarga(),
                    SimpanBtn(),
                  ],
                ))));
  }
}
