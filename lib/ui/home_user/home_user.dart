import 'package:flutter/material.dart';
import 'package:teach_finder_app/ui/utils/card_list_teacher.dart';
// push
class HomeUser extends StatelessWidget {
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
                        Image.asset("assets/illustration/user.png", height: 100)
                      ],
                    ),
                  ],
                ),
              ),
              // Container list guru private
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 44),
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
                    children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Color(0xFFFFCB17)
                                  )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on_sharp, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                      "Lokasi",
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(Icons.keyboard_arrow_down_outlined)
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                height: 35,
                                width: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color(0xFFFFCB17)
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.book, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                      "Mata Pelajaran",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                height: 35,
                                width: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color(0xFFFFCB17)
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.account_balance_sharp, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                      "Jenjang",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          CardListTeacher(
                            urlImage: "assets/icon/user_icon1.png",
                            name: "M. Fattah, S.Pd",
                            location: "Keputih",
                            salary: "85.000",
                          )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

}
