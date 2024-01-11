import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/calender/viewmodel/calender_viewmodel.dart';
import 'package:baby_tracker/pages/calender/widgets/tabbar_view.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:baby_tracker/pages/sleep/viewmodel/sleep_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  final calenderGetIt = locator<CalenderViewMoel>();
  final feedingGetIt = locator<FeedingViewModel>();
  final diaperGetIt = locator<DiaperViewModel>();
  final sleepGetIt = locator<SleepViewModel>();
  
 /*  @override
  void initState() {
    feedingGetIt.initGet();
    diaperGetIt.initDiaper();
    sleepGetIt.initSlep();
    super.initState();
  }
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) => Column(
          children: [
            Expanded(
              child: TabbarView(),
            ),
          ],
        ),
      ),
    );
  }
}
