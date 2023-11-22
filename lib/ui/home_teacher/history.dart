import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/page_not_found/history_not_found.dart';
import 'package:teach_finder_app/ui/utils/card_history_user.dart';

// Operasi statis boolean tampil atau hide data
bool hashDataTerima = true;
bool hashDataTolak = false;

class TolakContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HistoryNotFound();
  }
}

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text(
                  "History",
                  style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                      fontWeight: FontWeight.w700),
                ),
                centerTitle: true,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "Terima",
                    ),
                    Tab(text: "Tolak"),
                  ],
                )),
            body: TabBarView(
              children: [
                // Terima
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                        child: hashDataTerima
                            ? CardHistoryUser(
                                urlImage: "assets/icon/user_icon1.png",
                                name: "Jonathan Steven",
                                level: "SMA",
                                time: "Sabtu, 10.00 - 12.00 wib",
                                subject: "Bahasa indonesia",
                                status: "1")
                            : Center(
                                child: HistoryNotFound(),
                              ),
                      ),
                    ],
                  ),
                ),

                // Tolak
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                        child: hashDataTolak
                            ? CardHistoryUser(
                                urlImage: "assets/icon/user_icon1.png",
                                name: "Jonathan Steven",
                                level: "SMA",
                                time: "Sabtu, 10.00 - 12.00 wib",
                                subject: "Bahasa indonesia",
                                status: "0")
                            : Center(
                                child: HistoryNotFound(),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
