import 'package:baby_tracker/pages/calender/calender_model.dart';
import 'package:baby_tracker/pages/calender/widgets/List_item.dart';
import 'package:baby_tracker/pages/calender/widgets/toolbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  List<CalenderModel> calenderList = [
    CalenderModel(
        id: Uuid().v4(),
        history: DateTime.now(),
        catagori: "Diaper Change",
        created: "12"),
    CalenderModel(
        id: Uuid().v4(),
        history: DateTime.now(),
        catagori: "Feeding",
        created: "11"),
    CalenderModel(
        id: Uuid().v4(), history: DateTime.now(), catagori: "", created: "10"),
    CalenderModel(
        id: Uuid().v4(),
        history: DateTime.now(),
        catagori: "Sleep",
        created: "9")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calender",
            style: TextStyle(fontSize: 27, color: Color(0xFF4625C3))),
      ),
      body: Center(
          child: ListView(
        children: [
          Text("14 june 2020"),
          ToolBarWidgets(),
          for (var i = 0; i < calenderList.length; i++)
            Dismissible(
                onDismissed: (direction) {},
                key: UniqueKey(),
                child: ListItem(item: calenderList[i])),
        ],
      )),
    );
  }
}
