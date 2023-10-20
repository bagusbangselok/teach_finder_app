import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';
import 'package:teach_finder_app/ui/register/register_user.dart';
import 'package:teach_finder_app/ui/welcome/welcome.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRememberMe = false;
  Widget FormEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Masukkan Alamat Email",
            prefixIcon: Icon(Icons.mail, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget FormPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Masukkan Password",
            prefixIcon: Icon(Icons.lock, color: Colors.black87),
          ),
        )
      ],
    );
  }

  Widget RememberMe() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.white,
              activeColor: Color(0xFF00A7FF),
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember Me',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget LoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeUser()),
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
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget SignUpBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Welcome()),
        );
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Belum Mempunyai Akun ?',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          TextSpan(
              text: ' Register',
              style: TextStyle(
                  color: Color(0xFF00A7FF),
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Image.asset("assets/icon/icon_color.png", height: 50),
                    Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    // Image.asset("assets/icon/icon_color.png", height: 50),
                    SizedBox(height: 10),
                    Text(
                      'Halo Selamat Datang Di Aplikasi TeachFinder.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    ),
                    SizedBox(height: 50),
                    FormEmail(),
                    SizedBox(height: 30),
                    FormPassword(),
                    SizedBox(height: 20),
                    RememberMe(),
                    SizedBox(height: 10),
                    LoginBtn(),
                    SignUpBtn(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
