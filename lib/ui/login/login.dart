import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/icon/icon_header.png", height: 25),
              SizedBox(height: 25),
              Image.asset("assets/illustration/welcome.jpg")
            ],
          ),
        )
    );
  }
}
