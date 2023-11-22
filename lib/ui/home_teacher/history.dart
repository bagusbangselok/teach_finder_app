import 'package:flutter/material.dart';
import 'package:teach_finder_app/res/colors/colors.dart';
import 'package:teach_finder_app/ui/page_not_found/history_not_found.dart';

class TerimaContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HistoryNotFound();
  }
}

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
                // Component 1
                TerimaContent(),

                // Component 2
                TolakContent(),
              ],
            )));
  }
}
