// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/pages/calender/calender_model.dart';

class ListItem extends StatefulWidget {
  final CalenderModel item;
  const ListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                "12 Feb2021",
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
                  Text(widget.item.catagori
                      //  style: TextStyle(fontSize: 18),
                      ),
                ],
              ),
              Text(
                widget.item.created,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
