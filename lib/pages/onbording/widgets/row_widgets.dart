import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/onbording/viewmodel/onbording_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RowWidgets extends StatefulWidget {
  const RowWidgets({super.key});

  @override
  State<RowWidgets> createState() => _RowWidgetsState();
}

class _RowWidgetsState extends State<RowWidgets> {
  final onbordingGetIt = locator<OnbordingViewModel>();
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onbordingGetIt.OnbordingList.length,
          (index) => Container(
            height: DeviceConfig.screenHeight! * 0.0053,
            width: onbordingGetIt.currentIndex == index
                ? DeviceConfig.screenWidth! * 0.0700
                : DeviceConfig.screenWidth! * 0.0350,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                    onbordingGetIt.currentIndex == index ? btnBlue : lightGrey),
          ),
        ),
      ),
    );
  }
}
