import 'package:flutter/material.dart';
import 'package:teach_finder_app/ui/utils/card_list_teacher.dart';
import 'package:teach_finder_app/ui/utils/card_list_user.dart';

class HomeTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00A7FF),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30, // Changing Drawer Icon Size
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
                InkWell(
                  onTap: (){},
                  child: Image.asset("assets/icon/icon_white.png", width: 50),
                  borderRadius: BorderRadius.circular(50),
                )
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 40, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Halo, Daniel !!",
                            style: TextStyle(
                                color: Colors.white,fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: 12),
                        Text("Ingin mencari guru private mapel apa ??", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
              // Container list siswa
              SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 44),
                    width: double.infinity,
                    height: 550,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)
                        ),
                        shape:BoxShape.rectangle
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "List User Request",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 20),
                        CardListUser(
                            urlImage: "assets/icon/user_icon1.png",
                            name: "Ali Ismail",
                            level: "SMP",
                            subject: "Matematika",
                            time: "09.00-10.00 WIB",
                        )
                      ],
                    ),
                  ))
      ]
    )
    ),
    );
  }
}