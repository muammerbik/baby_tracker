import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/calender/viewmodel/calender_viewmodel.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_all_listView.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_diaper_listView.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_feed_listview.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_sleep_listView.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:baby_tracker/pages/sleep/viewmodel/sleep_viewmodel.dart';
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
  final feedingGetIt = locator<FeedingViewModel>();
  final diaperGetIt = locator<DiaperViewModel>();
  final sleepGetIt = locator<SleepViewModel>();

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
          leading: IconButton(
              onPressed: () {
                feedingGetIt.clearControllersFeeding();
                diaperGetIt.clearControllersDiaper();
                sleepGetIt.clearControlersSleep();
                Navigation.push(page: const HomeView());
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          title: const Column(
            children: [
              TextWidgets(
                text: calender,
                size: 30,
                fontWeight: FontWeight.bold,
                color: btnBlue,
              )
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(
              calenderGetIt.getFormattedDate(
                DateTime.now(),
              ),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: DeviceConfig.screenWidth! * 0.0467,
                  vertical: DeviceConfig.screenHeight! * 0.0207),
              child: TabBar(
                controller: tabController,
                tabs: <Widget>[
                  const Tab(
                    child: Tooltip(
                      message: all,
                      child: Text(
                        all,
                        style: TextStyle(
                            color: greyy,
                            fontSize: 32,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Tab(
                    height: 40,
                    child: Tooltip(
                      message: feeding,
                      child: Image.asset(
                        feedingIcon,
                        color: greyy,
                      ),
                    ),
                  ),
                  Tab(
                    height: 40,
                    child: Tooltip(
                      message: diaperChange,
                      child: Image.asset(
                        diaperIcon,
                        color: greyy,
                      ),
                    ),
                  ),
                  Tab(
                    child: Tooltip(
                      message: sleep,
                      child: Image.asset(
                        sleepIcon,
                        color: greyy,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  Observer(
                    builder: (context) {
                      calenderGetIt.mergeLists();
                      return const CustomAllListView();
                    },
                  ),
                  Observer(
                    builder: (context) => const CustomFeedListView(),
                  ),
                  Observer(
                    builder: (context) => const CustomDiaperListView(),
                  ),
                  Observer(
                    builder: (context) => const CustomSleepListView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
