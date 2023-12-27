import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/calender/viewmodel/calender_viewmodel.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_all_listView.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_diaper_listView.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_feed_listview.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_sleep_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TabbarView extends StatefulWidget {
  const TabbarView({Key? key}) : super(key: key);

  @override
  State<TabbarView> createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> with TickerProviderStateMixin {
  late final TabController tabController;

  final calenderGetIt = locator<CalenderViewMoel>();

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Calendar",
            style: TextStyle(
              fontSize: 27,
              color: Color(0xFF4625C3),
            ),
          ),
          centerTitle: true,
          bottom: TabBar(controller: tabController, tabs: <Widget>[
            Tab(
              child: Tooltip(
                message: "All",
                child: Text(
                  "All",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 27),
                ),
              ),
            ),
            Tab(
              child: Tooltip(
                message: "Feeding",
                child: Image.asset(
                  "assets/images/bottle.png",
                  height: 50,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            Tab(
              child: Tooltip(
                message: "Diaper Change",
                child: Image.asset(
                  "assets/images/diaper1.png",
                  height: 50,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            Tab(
              child: Tooltip(
                message: "Sleep",
                child: Image.asset(
                  "assets/images/sleep.png",
                  height: 50,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ]),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Observer(
              builder: (context) {
                calenderGetIt.mergeLists();
                return CustomAllListView();
              },
            ),
            Observer(
              builder: (context) => CustomFeedListView(),
            ),
            Observer(
              builder: (context) => CustomDiaperListView(),
            ),
            Observer(
              builder: (context) => CustomSleepListView(),
            ),
          ],
        ),
      ),
    );
  }
}
