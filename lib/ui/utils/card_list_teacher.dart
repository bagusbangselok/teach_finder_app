import 'package:flutter/material.dart';

class CardListTeacher extends StatelessWidget {
  final String urlImage;
  final String name;
  final String location;
  final String salary;

  const CardListTeacher({
    Key? key,
    required this.urlImage,
    required this.name,
    required this.location,
    required this.salary
  }) : super(key:key);
//push
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
              Row(
                children: [
                  Icon(
                    Icons.star, color: Color(0xFFFFCB17),
                  ),
                  Icon(
                      Icons.star, color: Color(0xFFFFCB17)
                  ),
                  Icon(
                      Icons.star, color: Color(0xFFFFCB17)
                  ),
                  Icon(
                      Icons.star, color: Color(0xFFFFCB17)
                  ),
                  Icon(
                      Icons.star, color: Color(0xFFFFCB17)
                  ),
                ],
              ),
              Text(location,
                  style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w400
                  )
              ),
              Text("Online",
                  style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w400
                  )
              ),
              Text("Rp $salary/jam",
                  style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w400
                  )
              ),
            ],
          ),
          SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 20,
                width: 50,
                padding: EdgeInsets.symmetric(
                    vertical: 5
                ),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    color: Color(0xFFDDEEF3)
                ),
                child: Text("Online",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400
                    )
                ),
              ),
              SizedBox(height: 40),
              Icon(Icons.bookmark_border, color: Color(0xFFFFCB17))
            ],
          )
        ],
      ),
    );
  }

}