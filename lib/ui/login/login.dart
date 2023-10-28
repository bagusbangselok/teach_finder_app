import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_user/home_user.dart';
import 'package:teach_finder_app/ui/login/controllers/login_controller.dart';
import 'package:teach_finder_app/ui/login/providers/login_provider.dart';
import 'package:teach_finder_app/ui/welcome/welcome.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginController _loginController = LoginController();
  bool _obscureText = true;
  bool isRememberMe = false;

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
              onChanged: (value) {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Email tidak boleh kosong',
                                          style: TextStyle(
                                              color: dangerColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      )
                                  );
                                } else if(value != null && !EmailValidator.validate(value)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Masukkan email yang valid',
                                          style: TextStyle(
                                              color: dangerColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      )
                                  );
                                } else return null;
                                },
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Masukkan Email",
                                prefixIcon: Icon(Icons.email, color: Colors.black87),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            TextField(
                              controller: _passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: "Masukkan Password",
                                prefixIcon: Icon(Icons.lock, color: Colors.black87),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState((){
                                      _obscureText = !_obscureText;
                                    });},
                                  icon: _obscureText == false
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility_outlined),
                                ),
                              ),
                            )
                          ],
                        ),
                        // SizedBox(height: 20),
                        // RememberMe(),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              _loginController.loginProcess(
                                context,
                                _emailController.text,
                                _passwordController.text,
                              );
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
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => Welcome()),
                        //     );
                        //   },
                        //   child: RichText(
                        //     text: TextSpan(children: [
                        //       TextSpan(
                        //         text: 'Belum mempunyai akun ?',
                        //         style: TextStyle(
                        //             color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                        //       ),
                        //       TextSpan(
                        //           text: ' Register',
                        //           style: TextStyle(
                        //               color: primaryColor,
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.w400,
                        //               decoration: TextDecoration.underline
                        //           )),
                        //     ]),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}