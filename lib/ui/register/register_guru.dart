import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:teach_finder_app/models/lokasi_model.dart';
import 'package:teach_finder_app/models/mata_pelajaran_model.dart';
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
  final _formKey = GlobalKey<FormState>();

  Widget FormNama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: (value) {
            if (value!.isEmpty || value == null) {
              return "Nama tidak boleh kosong";
            }
          },
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
          validator: (value) {
            if (value == null) {
              return "Silahkan pilih alamat anda";
            }
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.location_on, color: Colors.black87)),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          hint: Text("Pilih Kecamatan"),
          items: snapshotLokasi.data?.map((lokasi) {
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
    return TextFormField(
      validator: (value) {
        if (value == null || alamatController.text.isEmpty) {
          return "Alamat tidak boleh kosong";
        }
      },
      controller: alamatController,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
          hintText: "Masukkan Alamat Lengkap",
          prefixIcon: Icon(Icons.home, color: Colors.black87),
          labelText: "Alamat Lengkap"),
    );
  }

  String dropdownMapelValue = "Pilih Mata Pelajaran";
  Widget FormMapel() {
    return FutureBuilder(
        future: _controller.getListMapel(),
        builder:
            (context, AsyncSnapshot<List<MataPelajaranModel>> snapshotMapel) {
          return DropdownButtonFormField<String>(
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Harap pilih mata pelajaran";
                }
              },
              isExpanded: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.book_outlined, color: Colors.black87)),
              hint: Text("Pilih Mata Pelajaran"),
              icon: const Icon(Icons.keyboard_arrow_down),
              items: snapshotMapel.data?.map((mapel) {
                return DropdownMenuItem(
                  value: mapel.id.toString(),
                  child: Text(mapel.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownMapelValue = newValue!;
                });
              });
        });
  }

  String? filePath;
  String? fileName;
  String? fileFormat;
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
        fileFormat = fileName?.split('.').last;
      });
    }
  }

  Widget FormInputFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Silahkkan upload skl/ijazah anda";
            } else if (fileFormat != 'png' &&
                fileFormat != 'jpg' &&
                fileFormat != 'jpeg') {
              return "Format file harus png/jpg/jpeg";
            } else if (fileSizeInMB > 2.048) {
              return "Ukuran file maksimal 2 MB";
            }
          },
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
        // if (filePath != null)
        //   Text("File Terpilih : $filePath ($fileSizeInMB MB) $fileFormat"),
      ],
    );
  }

  Widget FormPhone() {
    return TextFormField(
      validator: (value) {
        if (value == null || phoneController.text.isEmpty) {
          return "No. telpon tidak boleh kosong";
        }
      },
      controller: phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: "Masukkan Nomor Telepon",
          prefixIcon: Icon(Icons.phone, color: Colors.black87),
          labelText: "Nomor Telepon"),
    );
  }

  Widget FormEmail() {
    return TextFormField(
      validator: (value) {
        if (value == null || emailController.text.isEmpty) {
          return "Email tidak boleh kosong";
        } else if (!EmailValidator.validate(value!)) {
          return "Email tidak valid";
        }
      },
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Masukkan Alamat Email",
          prefixIcon: Icon(Icons.email, color: Colors.black87),
          labelText: "Email"),
    );
  }

  Widget FormPassword() {
    return TextFormField(
      validator: (value) {
        if (value == null || passwordController.text.isEmpty) {
          return "Password tidak boleh kosong";
        } else if (value.length < 8) {
          return "Password minimal 8 karakter";
        }
      },
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Masukkan Password",
          prefixIcon: Icon(Icons.lock, color: Colors.black87),
          labelText: "Password"),
    );
  }

  Widget FormKonfirmasiPassword() {
    return TextFormField(
      validator: (value) {
        if (value == null || confirmPasswordController.text.isEmpty) {
          return "Password tidak boleh kosong";
        } else if (confirmPasswordController.text != passwordController.text) {
          return "Password tidak cocok";
        }
      },
      controller: confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Masukkan Konfirmasi Password",
          prefixIcon: Icon(Icons.lock, color: Colors.black87),
          labelText: "Konfirmasi password"),
    );
  }

  Widget RegisterGuruBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          print("${nameController.text}, ${emailController.text}, ${passwordController.text}, ${confirmPasswordController.text}, ${fileName}, ${dropdownLokasiValue}, ${phoneController.text}, ${alamatController.text}");
          if (_formKey.currentState!.validate()) {
            if (nameController.text.isEmpty ||
                emailController.text.isEmpty ||
                passwordController.text.isEmpty ||
                confirmPasswordController.text.isEmpty ||
                fileName!.isEmpty ||
                dropdownLokasiValue.isEmpty ||
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
              // if (EmailValidator.validate(emailController.text)) {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(
              //       'Email tidak valid',
              //       style: TextStyle(
              //           color: dangerColor,
              //           fontSize: 14,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ));
              // } else if (passwordController.text.length < 8) {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(
              //       'Password minimal 8 karakter',
              //       style: TextStyle(
              //           color: dangerColor,
              //           fontSize: 14,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ));
              // } else if (confirmPasswordController.text !=
              //     passwordController.text) {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(
              //       'Password tidak cocok',
              //       style: TextStyle(
              //           color: dangerColor,
              //           fontSize: 14,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ));
              // } else if (phoneController.text.length > 12) {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(
              //       'No. Telpon maksimal 12 angka',
              //       style: TextStyle(
              //           color: dangerColor,
              //           fontSize: 14,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ));
              // } else if (fileFormat != 'png' &&
              //     fileFormat != 'jpg' &&
              //     fileFormat != 'jpeg') {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(
              //       'Format file harus png/jpg/jpeg',
              //       style: TextStyle(
              //           color: dangerColor,
              //           fontSize: 14,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ));
              // } else if (fileSizeInMB > 2.048) {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(
              //       'Ukuran file maksimal 2MB',
              //       style: TextStyle(
              //           color: dangerColor,
              //           fontSize: 14,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ));
              // } else {
              _controller.registerTeacherProcess(
                  context,
                  nameController.text,
                  passwordController.text,
                  confirmPasswordController.text,
                  emailController.text,
                  phoneController.text,
                  dropdownMapelValue,
                  filePath.toString(),
                  fileName.toString(),
                  alamatController.text,
                  dropdownLokasiValue);
              // }
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
        child: Form(
          key: _formKey,
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
              FormMapel(),
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
              RegisterGuruBtn(context),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    ));
  }
}
