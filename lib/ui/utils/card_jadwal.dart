import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

class CardJadwal extends StatelessWidget {
  final bool isChecked;
  final String hari;
  final String time;
  final ValueChanged<bool>? onChanged;

  const CardJadwal({
    Key? key,
    required this.isChecked,
    required this.hari,
    required this.time,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.03 * screenWidth,
        vertical: 0.02 * screenHeight,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isChecked ? primaryColor.withOpacity(0.25) : whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isChecked
              ? blackColor.withOpacity(0.1)
              : blackColor.withOpacity(0.3),
        ),
      ),
      margin: EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          isChecked
              ? Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
