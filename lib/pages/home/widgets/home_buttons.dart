import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:flutter/material.dart';


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
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                widget.img,
                color: white,
              ),
            ),
            title: TextWidgets(
              text: widget.title,
              size: 22,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
  }
}
