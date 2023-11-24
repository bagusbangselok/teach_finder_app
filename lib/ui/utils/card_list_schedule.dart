import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

class CardListSchedule extends StatelessWidget {
  final String name;
  final String MataPelajaran;
  final String hari;
  final String jenjang;
  final String harga;

  const CardListSchedule({
    Key? key,
    required this.name,
    required this.MataPelajaran,
    required this.hari,
    required this.jenjang,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor)),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  )),
              SizedBox(height: 4),
              Text(MataPelajaran,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  )),
              SizedBox(height: 4),
              Text(hari,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              Text(jenjang,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              Text(harga,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            ])),
        SizedBox(height: 20)
      ],
    );
  }
}
