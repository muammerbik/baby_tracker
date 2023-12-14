import 'package:baby_tracker/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 119,
      decoration: ShapeDecoration(
        color: Color(0xFFF3F3F3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Column(children: [
        Row(
          children: [
            Image.asset(
              "assets/icons/file.png",
              height: 50,
            ),
            Text(
              "Tue,12 Feb",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images/bottle.png",
                    height: 40, color: darkBlue),
                Text(
                  "Sleep",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Text(
              "14.00.AM",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ]),
    );
  }
}
