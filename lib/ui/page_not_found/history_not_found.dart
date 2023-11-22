import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/res/responsive.dart';

class HistoryNotFound extends StatelessWidget {
  // Responsive _responsive = Responsive();
  final String urlImage;
  final String Info;

  static const String defaultImage = 'assets/illustration/history.png';
  static const String defaultInfo = 'Belum Ada History';

  const HistoryNotFound(
      {Key? key, this.urlImage = defaultImage, this.Info = defaultInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 120),
        Image.asset(urlImage, height: 180),
        SizedBox(height: 12),
        Text(Info,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ))
      ],
    )));
  }
}
