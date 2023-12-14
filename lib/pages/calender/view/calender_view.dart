import 'package:baby_tracker/pages/calender/widgets/List_item.dart';
import 'package:baby_tracker/pages/calender/widgets/toolbar_widgets.dart';
import 'package:flutter/material.dart';

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
        title: Text("Calender",
            style: TextStyle(fontSize: 27, color: Color(0xFF4625C3))),
      ),
      body: Center(
        child: Column(children: [
          Text("14 june 2020"),
          ToolBarWidgets(),
          ListItem(),
        ]),
      ),
    );
  }
}
