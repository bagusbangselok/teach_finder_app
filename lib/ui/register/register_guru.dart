import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/lokasi_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/login/login.dart';
import 'package:teach_finder_app/ui/register/controller/register_controller.dart';


class RegisterGuru extends StatefulWidget {
  @override
  _RegisterGuruState createState() => _RegisterGuruState();
}

class _RegisterGuruState extends State<RegisterGuru> {
  final RegisterController _controller = RegisterController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController sklIjazahController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final GlobalKey dropdownKey = GlobalKey();
  late LokasiModel _kecamatan;

  Widget FormNama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: nameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              hintText: "Masukkan Nama Lengkap",
              prefixIcon: Icon(Icons.person, color: Colors.black87),
              labelText: "Nama Lengkap"),
        ),
      ],
    );
  }

  // Dropdown Widget
  // List<String> kecamatan = DataKecamatan().dataKecamatan();
  String dropdownLokasiValue = "Pilih Kecamatan";
  Widget LokasiAlamat() {
    return FutureBuilder<List<LokasiModel>>(
      future: _controller.getListKecamatan(),
      builder: (BuildContext context,
          AsyncSnapshot<List<LokasiModel>> snapshotLokasi) {
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.location_on, color: Colors.black87)),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          hint: Text("Pilih Kecamatan"),
          items: snapshotLokasi.data!.map((lokasi) {
            return DropdownMenuItem<String>(
              value: lokasi.id.toString(),
              child: Text(lokasi.name),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownLokasiValue = newValue!;
            });
          },
        );
      },
    );
  }

  // Widget Form Alamat
  Widget FormAlamat() {
    return TextField(
      controller: alamatController,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
          hintText: "Masukkan Alamat Lengkap",
          prefixIcon: Icon(Icons.home, color: Colors.black87),
          labelText: "Alamat Lengkap"),
    );
  }

  String? filePath;
  String? fileName;
  late int fileSizeInBytes;
  late double fileSizeInMB;

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
        fileName = result.files.single.name;
        fileSizeInBytes = result.files.single.size;
        fileSizeInMB = (fileSizeInBytes / (1024 * 1024));
      });
    }
  }

  Widget FormInputFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TextField(
          onTap: () => _openFileExplorer(),
          enableInteractiveSelection: false,
          readOnly: true,
          controller:
              TextEditingController(text: fileName ?? "Pilih File SKL/Ijazah"),
          decoration: InputDecoration(
            hintText: "Pilih File SKL/Ijazah",
            prefixIcon: IconButton(
                onPressed: () => _openFileExplorer(),
                icon: Icon(Icons.folder_open),
                color: Colors.black87),
          ),
        ),
        if (filePath != null) Text("File Terpilih : $filePath ($fileSizeInMB MB)"),
      ],
    );
  }

  Widget FormPhone() {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: "Masukkan Nomor Telepon",
          prefixIcon: Icon(Icons.phone, color: Colors.black87),
          labelText: "Nomor Telepon"),
    );
  }

  Widget FormEmail() {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Masukkan Alamat Email",
          prefixIcon: Icon(Icons.email, color: Colors.black87),
          labelText: "Email"),
    );
  }

  Widget FormPassword() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Masukkan Password",
          prefixIcon: Icon(Icons.lock, color: Colors.black87),
          labelText: "Password"),
    );
  }

  Widget FormKonfirmasiPassword() {
    return TextField(
      controller: confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Masukkan Konfirmasi Password",
          prefixIcon: Icon(Icons.lock, color: Colors.black87),
          labelText: "Konfirmasi password"),
    );
  }

  Widget RegisterGuruBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (nameController.text.isEmpty ||
              emailController.text.isEmpty ||
              passwordController.text.isEmpty ||
              confirmPasswordController.text.isEmpty ||
              fileName!.isEmpty ||
              phoneController.text.isEmpty ||
              alamatController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Daftar gagal. Harap lengkapi data anda.',
                style: TextStyle(
                    color: dangerColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ));
          } else {
            if (passwordController.text.length < 8) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Password minimal 8 karakter',
                  style: TextStyle(
                      color: dangerColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ));
            } else if (confirmPasswordController.text !=
                passwordController.text) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Password tidak cocok',
                  style: TextStyle(
                      color: dangerColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ));
            } else if (phoneController.text.length > 12) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'No. Telpon maksimal 12 angka',
                  style: TextStyle(
                      color: dangerColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ));
            } else if(fileSizeInMB > 2.0) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Ukuran file maksimal 2MB',
                  style: TextStyle(
                      color: dangerColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ));
            } else {
              _controller.registerTeacherProcess(
                  nameController.text,
                  passwordController.text,
                  confirmPasswordController.text,
                  emailController.text,
                  phoneController.text,
                  filePath.toString(),
                  fileName.toString(),
                  alamatController.text,
                  dropdownLokasiValue);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            }
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
            SizedBox(height: 10),
            Image.asset("assets/icon/icon_color.png", height: 50),
            Text(
              'Register Guru',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
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
