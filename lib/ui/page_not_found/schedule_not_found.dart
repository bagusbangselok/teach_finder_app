import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

class ScheduleNotFound extends StatelessWidget {
  final String urlImage;
  final String info;

  static const String defaultImage = 'assets/illustration/list_data.png';
  static const String defaultInfo = 'Belum Ada Jadwal';

  const ScheduleNotFound(
      {Key? key, this.urlImage = defaultImage, this.info = defaultInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(urlImage, height: 180),
          SizedBox(height: 12),
          Text(info,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: primaryColor))
        ],
      ),
    );
  }
}
