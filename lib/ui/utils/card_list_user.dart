import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

class CardListUser extends StatelessWidget {
  final String urlImage;
  final String name;
  final String level;
  final String subject;
  final String time;

  const CardListUser(
      {Key? key,
      required this.urlImage,
      required this.name,
      required this.level,
      required this.time,
      required this.subject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
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
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              child: Image.asset(urlImage),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(level,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(subject,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                Text(time,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(width: 12),
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
        ));
  }
}
