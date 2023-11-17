import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_finder_app/models/jenjang_model.dart';
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
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Widget FormNama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TextField(
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
        TextField(
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
  var dropdownJenjangValue;

  Widget JenjangSekolah() {
    return DropdownSearch<JenjangModel>(
      asyncItems: (text) => _registerController.loadJenjangFromJson(),
      itemAsString: (item) => "${item.name}",
      onChanged: (JenjangModel? data) => print(data),
      dropdownButtonProps:
      DropdownButtonProps(icon: Icon(Icons.keyboard_arrow_down_outlined)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              prefixIcon: Icon(Icons.school, color: Colors.black87),
              labelText: "Pilih Jenjang")),
      onSaved: (JenjangModel? value) {
        dropdownJenjangValue = value;
      },
    );
  }

  Widget FormPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TextField(
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
        TextField(
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
        TextField(
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
        TextField(
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
          _registerController.registerUserProcess(
              context,
              _nameController.text,
              _passwordController.text,
              _confirmPasswordController.text,
              _emailController.text,
              _phoneController.text,
              dropdownJenjangValue.id.toString(),
              _addressController.text
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
