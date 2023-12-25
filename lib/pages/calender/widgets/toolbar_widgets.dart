import 'package:baby_tracker/pages/calender/widgets/custom_diaper_listView.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_feed_listview.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_sleep_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ToolBarWidgets extends StatefulWidget {
  const ToolBarWidgets({super.key});

  @override
  State<ToolBarWidgets> createState() => _ToolBarWidgetsState();
}

class _ToolBarWidgetsState extends State<ToolBarWidgets> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Tooltip(
          message: "All",
          child: TextButton(
            onPressed: () {},
            child: Text(
              "All",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 27),
            ),
          ),
        ),
        Tooltip(
          message: "Feeding",
          child: IconButton(
            onPressed: () {
              Expanded(child: CustomSleepListView());
            },
            icon: Image.asset(
              "assets/images/bottle.png",
              height: 50,
              color: Colors.grey.shade400,
            ),
          ),
        ),
        Tooltip(
          message: "Diaper Change",
          child: IconButton(
            onPressed: () {
              Expanded(child: CustomDiaperListView());
            },
            icon: Image.asset(
              "assets/images/diaper1.png",
              height: 50,
              color: Colors.grey.shade400,
            ),
          ),
        ),
        Tooltip(
          message: "Sleep",
          child: IconButton(
            onPressed: () {
              Expanded(child: CustomSleepListView());
            },
            icon: Image.asset("assets/images/sleep.png",
                height: 50, color: Colors.grey.shade400),
          ),
        )
      ],
    ),);
  }
}
