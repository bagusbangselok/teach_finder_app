import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

class CardJadwal extends StatelessWidget {
  final bool isChecked;
  final String hari;
  final String time;
  final VoidCallback onTap;

  const CardJadwal({
    Key? key,
    required this.isChecked,
    required this.hari,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.0),
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: isChecked ? Colors.blue.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isChecked ? Colors.blue : Colors.grey,
            width: isChecked ? 2.0 : 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hari,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
