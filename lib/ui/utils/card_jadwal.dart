import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

class CardJadwal extends StatelessWidget {
  final bool IsChecked;
  final String hari;
  final String time;
  // final VoidCallback onTap;

  const CardJadwal({
    super.key,
    required this.IsChecked,
    required this.hari,
    required this.time,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      // onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 0.03 * screenWidth, vertical: 0.02 * screenHeight),
          width: double.infinity,
          decoration: BoxDecoration(
            color: IsChecked ? primaryColor.withOpacity(0.25) : whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: IsChecked
                    ? blackColor.withOpacity(0.1)
                    : blackColor.withOpacity(0.3)),
          ),
          margin: EdgeInsets.all(6),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                right: 5,
                child: Icon(
                  IsChecked ? Icons.check : null,
                  color: IsChecked ? Colors.green : whiteColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hari,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 6),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
