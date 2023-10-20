import 'package:flutter/material.dart';

class CardListUser extends StatelessWidget {
  final String urlImage;
  final String name;
  final String level;
  final String subject;
  final String time;

  const CardListUser({
    Key? key,
    required this.urlImage,
    required this.name,
    required this.level,
    required this.time,
    required this.subject
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFDDEEF3)
          )
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
                  style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w600)
              ),
              Text(level,
                  style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w400
                  )
              ),
              Text(subject,
                  style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w400
                  )
              ),
              Text(time,
                  style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w400
                  )
              ),
            ],
          ),
          SizedBox(width: 30)
        ],
      ),
    );
  }

}