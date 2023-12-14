import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/pages/calender/view/calender_view.dart';
import 'package:baby_tracker/pages/settings/view/settings_view.dart';
import 'package:flutter/material.dart';

class HomeRow extends StatefulWidget {
  const HomeRow({super.key});

  @override
  State<HomeRow> createState() => _HomeRowState();
}

class _HomeRowState extends State<HomeRow> {
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigation.push(page: SettingsView());
          },
          icon: Image.asset(
            "assets/icons/stng.png",
            height: DeviceConfig.screenHeight! * 0.0269,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: DeviceConfig.screenHeight! * 0.1428,
            height: DeviceConfig.screenHeight! * 0.1399,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/onbording1.png"),
                fit: BoxFit.fill,
              ),
              shape: OvalBorder(
                side: BorderSide(width: 1, color: purple),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
              Navigation.push(page: CalenderView());
          },
          icon: Image.asset(
            "assets/icons/file.png",
            height: DeviceConfig.screenHeight! * 0.0485,
          ),
        ),
      ],
    );
  }
}
