import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_finder_app/res/colors/colors.dart';

// sesi
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
      onTap: onTap, // Menggunakan onTap sebagai aksi ketika dipilih
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        decoration: BoxDecoration(
          color: isChecked ? Colors.blue.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isChecked ? Colors.blue : Colors.grey,
            width: isChecked ? 2.0 : 1.0,
          ),
        ),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 5,
              child: Icon(
                isChecked ? Icons.check_circle : null,
                color: isChecked ? Colors.green : whiteColor,
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
        ),
      ),
    );
  }
}
