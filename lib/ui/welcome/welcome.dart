import 'package:flutter/material.dart';
import 'package:teach_finder_app/ui/login/login.dart';


class Welcome extends StatelessWidget {
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
            Image.asset("assets/illustration/welcome.jpg"),
            SizedBox(height: 28),
            Center(
              child: Column(
                children: [
                  Text("Selamat datang di TeachFinder!",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22)),
                  SizedBox(height: 14),
                  Text("Aplikasi dimana kamu bisa mencari guru private di area yang kamu mau",
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
                  SizedBox(height: 82),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF00A7FF),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text("Masuk", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),)
                      )
                  )
                ],
            )),
          ],
        ),
      )
    );
  }
}
