import 'package:flutter/material.dart';

class ToolBarWidgets extends StatefulWidget {
  const ToolBarWidgets({super.key});

  @override
  State<ToolBarWidgets> createState() => _ToolBarWidgetsState();
}

class _ToolBarWidgetsState extends State<ToolBarWidgets> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
            icon: Image.asset("assets/images/sleep.png",
                height: 50, color: Colors.grey.shade400),
          ),
        )
      ],
    );
  }
}
