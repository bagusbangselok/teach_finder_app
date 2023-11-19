import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';
import 'package:teach_finder_app/ui/login/login.dart';
import 'package:teach_finder_app/ui/register/controller/register_controller.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  RegisterController _registerController = RegisterController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Widget FormNama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
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
      children: [
        SizedBox(height: 10),
        TextFormField(
          controller: _addressController,
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Masukkan Alamat Lengkap",
            prefixIcon: Icon(Icons.home, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  // Dropdown Widget
  String dropdownJenjangValue = "Pilih Jenjang";

  // List Item dropdown menu

  Widget JenjangSekolah() {
    return FutureBuilder<List<JenjangModel>>(
      future: _registerController.getListJenjang(),
      builder: (BuildContext context,
          AsyncSnapshot<List<JenjangModel>> snapshotJenjang) {
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.school, color: Colors.black87)),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          hint: Text("Pilih Jenjang"),
          items: snapshotJenjang.data!.map((jenjang) {
            return DropdownMenuItem<String>(
              value: jenjang.id.toString(),
              child: Text(jenjang.name),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownJenjangValue = newValue!;
            });
          },
        );
      },
    );
  }

  Widget FormPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
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
      children: [
        SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap masukkan email anda';
            }
            return null;
          },
          controller: _emailController,
          textInputAction: TextInputAction.next,
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
      children: [
        SizedBox(height: 10),
        TextFormField(
          controller: _passwordController,
          textInputAction: TextInputAction.next,
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
      children: [
        SizedBox(height: 10),
        TextFormField(
          controller: _confirmPasswordController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Masukkan Konfirmasi Password",
            prefixIcon: Icon(Icons.lock, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget RegisterUserBtn(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          print("dropdown: ${dropdownJenjangValue}");
          if (_nameController.text.isEmpty ||
              _passwordController.text.isEmpty ||
              _confirmPasswordController.text.isEmpty ||
              _emailController.text.isEmpty ||
              _phoneController.text.isEmpty ||
              dropdownJenjangValue.isEmpty ||
              _addressController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'Daftar gagal. Silahkan cek isian anda kembali.',
                style: TextStyle(
                    color: dangerColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ));
          } else {
            if (_passwordController.text.length < 8) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Password minimal 8 karakter',
                  style: TextStyle(
                      color: dangerColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ));
            } else if (_confirmPasswordController.text !=
                _passwordController.text) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Password tidak cocok',
                  style: TextStyle(
                      color: dangerColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ));
            } else if (_phoneController.text.length > 12) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'No. Telpon maksimal 12 angka',
                  style: TextStyle(
                      color: dangerColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ));
            } else {
              _registerController.registerUserProcess(
                  context,
                  _nameController.text,
                  _passwordController.text,
                  _confirmPasswordController.text,
                  _emailController.text,
                  _phoneController.text,
                  dropdownJenjangValue,
                  _addressController.text);
            }
          }
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
            SizedBox(height: 40),
            Image.asset("assets/icon/icon_color.png", height: 50),
            SizedBox(height: 10),
            Text(
              'Register User',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              'Halo Silahkan Registrasi Sebagai User.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),
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
            RegisterUserBtn(
              context,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    ));
  }
}
