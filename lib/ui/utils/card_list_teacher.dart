import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

class CardListTeacher extends StatelessWidget {
  final String urlImage;
  final String name;
  final String location;
  final String subject;
  final String salary;

  const CardListTeacher(
      {Key? key,
      required this.urlImage,
      required this.name,
      required this.location,
      required this.subject,
      required this.salary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: blackColor.withOpacity(0.4),
                spreadRadius: 0.5,
                blurRadius: 6,
                offset: Offset(1, 3)),
          ]),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            child: Image.asset(urlImage),
          ),
          SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              // Row(
              //   children: [
              //     Icon(
              //       Icons.star,
              //       color: Color(0xFFFFCB17),
              //     ),
              //     Icon(Icons.star, color: Color(0xFFFFCB17)),
              //     Icon(Icons.star, color: Color(0xFFFFCB17)),
              //     Icon(Icons.star, color: Color(0xFFFFCB17)),
              //     Icon(Icons.star, color: Color(0xFFFFCB17)),
              //   ],
              // ),
              SizedBox(height: 4),
              Text(location,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              SizedBox(height: 4),
              Text(subject,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              SizedBox(height: 4),
              Text("Rp $salary/jam",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            ],
          ),
          SizedBox(width: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.chevron_right,
                color: blackColor,
                size: 24,
              )
            ],
          )
        ],
      ),
    );
  }
}
