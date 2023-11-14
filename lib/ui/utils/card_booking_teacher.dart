import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

class CardListBooking extends StatelessWidget {
  final String urlImage;
  final String name;
  final String location;
  final String subject;
  final String salary;
  final String status;
  final String phone;

  const CardListBooking(
      {Key? key,
      required this.urlImage,
      required this.name,
      required this.location,
      required this.subject,
      required this.salary,
      required this.status,
      required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 0.02 * screenWidth, vertical: 20),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                child: Image.asset(urlImage),
              ),
              SizedBox(width: 0.04 * screenWidth),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  Text(subject,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  Text("Rp $salary/jam",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(width: 0.04 * screenWidth),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: status == '0' ? silver : successColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: status == '0'
                                ? Flexible(
                                    child: Text(
                                      "Menunggu\n persetujuan",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: blackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: whiteColor,
                                        size: 10,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "Disetujui",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: blackColor,
            height: 1,
          ),
          SizedBox(height: 10),
          status == '0'
              ? Center()
              : Text(
                  "Silahkan hubungi guru anda : +${phone}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
        ],
      ),
    );
  }
}
