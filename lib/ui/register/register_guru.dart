import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_finder_app/ui/login/login.dart';
import 'package:file_picker/file_picker.dart';

class RegisterGuru extends StatefulWidget {
  @override
  _RegisterGuruState createState() => _RegisterGuruState();
}

class _RegisterGuruState extends State<RegisterGuru> {
  Widget FormNama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: "Masukkan Nama Lengkap",
            prefixIcon: Icon(Icons.person, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  // Dropdown Widget
  String dropdownvalue = 'Pilih Lokasi Anda';
  List<String> lokasi = ['Pilih Lokasi Anda', 'Keputih', 'Gubeng', 'Kertajaya'];
  Widget LokasiAlamat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        DropdownButton(
          isExpanded: true,
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: lokasi.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After select
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        ),
      ],
    );
  }
  // End Widget

  Widget FormAlamat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.streetAddress,
          decoration: InputDecoration(
            hintText: "Masukkan Alamat Lengkap",
            prefixIcon: Icon(Icons.home, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  String? filePath;

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
      });
    }
  }

  Widget FormInputFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TextField(
          enableInteractiveSelection: false,
          readOnly: true,
          controller:
              TextEditingController(text: filePath ?? "Pilih File SKL/Ijazah"),
          decoration: InputDecoration(
            hintText: "Pilih File SKL/Ijazah",
            prefixIcon: IconButton(
                onPressed: () => _openFileExplorer(),
                icon: Icon(Icons.folder_open),
                color: Colors.black87),
          ),
        ),
        if (filePath != null) Text("File Terpilih : $filePath"),
      ],
    );
  }

  Widget FormPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: "Masukkan Nomor Telepon",
            prefixIcon: Icon(Icons.phone, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget FormEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Masukkan Alamat Email",
            prefixIcon: Icon(Icons.email, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget FormPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Masukkan Password",
            prefixIcon: Icon(Icons.lock, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget FormKonfirmasiPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Masukkan Konfirmasi Password",
            prefixIcon: Icon(Icons.lock, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget RegisterGuruBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          primary: Color(0xFF00A7FF),
        ),
        child: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Register Guru',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            // Image.asset("assets/icon/icon_color.png", height: 50),
            // SizedBox(height: 10),
            Text(
              'Halo Silahkan Registrasi Sebagai Guru.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
            SizedBox(height: 40),
            FormNama(),
            SizedBox(height: 20),
            LokasiAlamat(),
            SizedBox(height: 20),
            FormAlamat(),
            SizedBox(height: 20),
            FormInputFile(),
            SizedBox(height: 20),
            FormPhone(),
            SizedBox(height: 20),
            FormEmail(),
            SizedBox(height: 20),
            FormPassword(),
            SizedBox(height: 20),
            FormKonfirmasiPassword(),
            SizedBox(height: 30),
            RegisterGuruBtn(),
            SizedBox(height: 30),
          ],
        ),
      ),
    ));
  }
}
