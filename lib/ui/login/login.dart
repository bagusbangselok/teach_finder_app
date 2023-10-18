import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRememberMe = false;

  Widget FormEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email : ',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 60,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'Enter Your Email Address',
                  hintStyle: TextStyle(color: Colors.black38)),
            ))
      ],
    );
  }

  Widget FormPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password : ',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 60,
            child: TextField(
              obscureText: true,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  hintText: 'Enter Your Password',
                  hintStyle: TextStyle(color: Colors.black38)),
            ))
      ],
    );
  }

// Widget ForgotPassBtn() {
//   return Container(
//     alignment: Alignment.centerRight, // Align the button to the right
//     child: FlatButton(
//       onPressed: () {
//         print("Forgot Password pressed");
//         // Add your logic for handling the "Forgot Password" action here
//       },
//       padding: EdgeInsets.only(right: 0),
//       child: Text(
//         'Forgot Password ? ',
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }

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
          print('Login Press'); // You can add your logic here
        },
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Image.asset("assets/icon/logo_app.png", height: 25),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF00A7FF),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    FormEmail(),
                    SizedBox(height: 30),
                    FormPassword(),
                    // ForgotPassBtn(),
                    SizedBox(height: 20),
                    RememberMe(),
                    SizedBox(height: 10),
                    LoginBtn(),
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
