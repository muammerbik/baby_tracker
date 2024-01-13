import 'dart:io';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/calender/view/calender_view.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/pages/settings/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeRow extends StatefulWidget {
  const HomeRow({super.key});

  @override
  State<HomeRow> createState() => _HomeRowState();
}

class _HomeRowState extends State<HomeRow> {
  final informationGetIt = locator<InformationViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);

    final String? localImagePath = informationGetIt.imageFile?.path;

    return Observer(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigation.push(page: const SettingsView());
            },
            icon: Image.asset(
              settngImg,
              height: DeviceConfig.screenHeight! * 0.0339,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: DeviceConfig.screenHeight! * 0.0259,
            ),
            child: Container(
              width: DeviceConfig.screenHeight! * 0.1428,
              height: DeviceConfig.screenHeight! * 0.1399,
              decoration: ShapeDecoration(
                image: localImagePath != null
                    ? DecorationImage(
                        image: FileImage(File(localImagePath)),
                        fit: BoxFit.fill,
                      )
                    : null,
                shape: const OvalBorder(
                  side: BorderSide(width: 1, color: purple),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigation.push(
                page: const CalenderView(),
              );
            },
            icon: Image.asset(
              calenderImg,
              height: DeviceConfig.screenHeight! * 0.0585,
            ),
          ),
        ],
      ),
    );
  }
}
