import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InformationRow extends StatefulWidget {
  const InformationRow({Key? key}) : super(key: key);

  @override
  State<InformationRow> createState() => _InformationRowState();
}

class _InformationRowState extends State<InformationRow> {
  final informationGetIt = locator<InformationViewModel>();
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        GestureDetector(
  onTap: () {
    informationGetIt.toggleGirlImage();
  },
  child: informationGetIt.isGirl != null && informationGetIt.isGirl!
      ? Image.asset(
          "assets/images/bbbx.png",
          height: DeviceConfig.screenHeight! * 0.0323,
          width: DeviceConfig.screenWidth! * 0.0700,
        )
      : Image.asset(
          "assets/images/xx.png",
          height: DeviceConfig.screenHeight! * 0.0323,
          width: DeviceConfig.screenWidth! * 0.0700,
        ),
),

SizedBox(
  width: DeviceConfig.screenWidth! * 0.0700,
),

GestureDetector(
  onTap: () {
    informationGetIt.toggleSonImage();
  },
  child: informationGetIt.isGirl != null && !informationGetIt.isGirl!
      ? Image.asset(
          "assets/images/aaay.png",
          height: DeviceConfig.screenHeight! * 0.0323,
          width: DeviceConfig.screenWidth! * 0.0700,
        )
      : Image.asset(
          "assets/images/yy.png",
          height: DeviceConfig.screenHeight! * 0.0323,
          width: DeviceConfig.screenWidth! * 0.0700,
        ),
),

        ],
      ),
    );
  }
}
