import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_finder_app/ui/login/login.dart';

class RegisterGuru extends StatelessWidget {
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

  // Widget RegisterUserBtn() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 25),
  //     width: double.infinity,
  //     child: ElevatedButton(
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => Login()),
  //         );
  //       },
  //       style: ElevatedButton.styleFrom(
  //         elevation: 5,
  //         padding: EdgeInsets.all(15),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(5),
  //         ),
  //         primary: Color(0xFF00A7FF),
  //       ),
  //       child: Text(
  //         'Register',
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 19,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // children
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
            SizedBox(height: 30),
            FormNama(),
            SizedBox(height: 20),
            FormAlamat(),
            SizedBox(height: 20),
            FormEmail(),
            SizedBox(height: 20),
            FormPassword(),
            SizedBox(height: 20),
            FormKonfirmasiPassword(),
            SizedBox(height: 30),
            SizedBox(
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
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    ));
  }
}
