import 'package:baby_tracker/pages/calender/widgets/custom_diaper_listView.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_feed_listview.dart';
import 'package:baby_tracker/pages/calender/widgets/custom_sleep_listView.dart';
import 'package:baby_tracker/pages/calender/widgets/toolbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Calender",
          style: TextStyle(
            fontSize: 27,
            color: Color(0xFF4625C3),
          ),
        ),
      ),
      body: Observer(
        builder: (context) => Column(
          children: [
         Text('12 Monday'),
          ToolBarWidgets(),
          ],
        ),
      ),

      /*  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         
        ],
      ), */
    );
  }
}
