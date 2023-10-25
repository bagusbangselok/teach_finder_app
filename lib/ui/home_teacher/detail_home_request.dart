import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/home_teacher/home_teacher_request.dart';

class DetailHomeRequest extends StatelessWidget {
  // Make Widget For Popup Dialog Comment
  Widget CommentDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Catatan",
        style: TextStyle(
            fontSize: 20, color: blackColor, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(decoration: InputDecoration(hintText: "Masukkan Saran")),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Batal',
              style: TextStyle(
                color: dangerColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: whiteColor,
              side: BorderSide(
                color: dangerColor,
              ),
            )),
        ElevatedButton(
          onPressed: () {},
          child: Text("Simpan"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: whiteColor,
                              size: 28,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text("Detail User",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: whiteColor,
                              ))
                        ])
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Center(
                      child: Column(children: [
                    Image.asset("assets/icon/user_icon1.png", height: 120),
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColor.withOpacity(0.3),
                                    spreadRadius: 0.5,
                                    blurRadius: 6,
                                    offset: Offset(1, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Steven Martin",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: blackColor)),
                                  SizedBox(height: 8),
                                  Text("SMP",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: blackColor)),
                                  SizedBox(height: 8),
                                  Text(
                                    "Senin : 15.00 - 16.00",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: blackColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Jalan Keputih No 17 F, Surabaya",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: blackColor))
                                ]))),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CommentDialog(context);
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          padding: EdgeInsets.all(18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          primary: primaryColor,
                        ),
                        child: Text(
                          "Terima",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CommentDialog(context);
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: whiteColor,
                                side: BorderSide(color: primaryColor, width: 1),
                                padding: EdgeInsets.all(18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Tolak",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                            ))
                      ],
                    )
                  ]))
                ])));
  }
}
