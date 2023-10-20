import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_finder_app/ui/login/login.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
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

  // Dropdown Widget
  String dropdownvalue = 'Pilih Jenjang Sekolah';
  // List Item dropdown menu
  var jenjang = ['Pilih Jenjang Sekolah', 'SD', 'SMP', 'SMA/SMK'];
  Widget JenjangSekolah() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        DropdownButton(
          isExpanded: true,
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: jenjang.map((String items) {
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

  Widget FormPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.emailAddress,
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

  Widget RegisterUserBtn() {
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
            SizedBox(height: 10),
            Image.asset("assets/icon/icon_color.png", height: 50),
            Text(
              'Register User',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Text(
              'Halo Silahkan Registrasi Sebagai User.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
            SizedBox(height: 30),
            FormNama(),
            SizedBox(height: 20),
            FormAlamat(),
            SizedBox(height: 20),
            JenjangSekolah(),
            SizedBox(height: 20),
            FormPhone(),
            SizedBox(height: 20),
            FormEmail(),
            SizedBox(height: 20),
            FormPassword(),
            SizedBox(height: 20),
            FormKonfirmasiPassword(),
            SizedBox(height: 30),
            RegisterUserBtn(),
            SizedBox(height: 30),
          ],
        ),
      ),
    ));
  }
}
