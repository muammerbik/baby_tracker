// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';

class HomeButtons extends StatefulWidget {
  final Color color;
  final String title;
  final String img;

  final VoidCallback? onTap;
  const HomeButtons({
    Key? key,
    required this.color,
    required this.title,
    required this.img,
    this.onTap,
  }) : super(key: key);

  @override
  State<HomeButtons> createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: DeviceConfig.screenWidth! * 0.0560,
          vertical: DeviceConfig.screenHeight! * 0.0107),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: DeviceConfig.screenWidth! * 0.8878,
          height: DeviceConfig.screenHeight! * 0.0680,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: ListTile(
              contentPadding:
                  EdgeInsets.only(left: DeviceConfig.screenWidth! * 0.0150),
              leading: Image.asset(
                widget.img,
              ),
              title: TextWidgets(
                text: widget.title,
                size: 22,
                textAlign: TextAlign.start,
              )),
        ),
      ),
    );
  }
}
