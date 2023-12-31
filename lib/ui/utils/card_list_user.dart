import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

class CardListUser extends StatelessWidget {
  final String urlImage;
  final String name;
  final String level;
  final String subject;
  final String time;
  final String status;

  const CardListUser(
      {Key? key,
      required this.urlImage,
      required this.name,
      required this.level,
      required this.time,
      required this.subject,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        padding:
            EdgeInsets.symmetric(vertical: 0.03 * screenWidth, horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor,   
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: blackColor),
            ),
        margin: EdgeInsets.symmetric(horizontal: 0.01 * screenWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 80,
              child: Image.asset(urlImage),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(level,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(subject,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  Text(time,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(width: 0.01 * screenWidth),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                status == '0'
                    ? Text('Menunggu...',
                        style: TextStyle(color: Colors.black54, fontSize: 12))
                    : Text('Disetujui',
                        style: TextStyle(color: successColor, fontSize: 12)),
                SizedBox(height: 20),
                Icon(
                  Icons.chevron_right,
                  color: blackColor,
                  size: 24,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ));
  }
}
