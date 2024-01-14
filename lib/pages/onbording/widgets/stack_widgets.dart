// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/onbording/viewmodel/onbording_viewmodel.dart';
import 'package:baby_tracker/pages/onbording/widgets/row_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StackWidgets extends StatefulWidget {
  final int onbordingIndex;
  const StackWidgets({
    Key? key,
    required this.onbordingIndex,
  }) : super(key: key);

  @override
  State<StackWidgets> createState() => _StackWidgetsState();
}

class _StackWidgetsState extends State<StackWidgets> {
  final onboardingViewmodel = locator<OnbordingViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => Stack(
        children: [
          Image.asset(
            onboardingViewmodel.OnbordingList[widget.onbordingIndex].img,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: DeviceConfig.screenHeight! * 0.362,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: DeviceConfig.screenHeight! * 0.0269),
                  TextWidgets(
                      text: onboardingViewmodel
                          .OnbordingList[widget.onbordingIndex].title,
                      size: 31,
                      color: black),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.0161),
                  TextWidgets(
                    text: onboardingViewmodel
                        .OnbordingList[widget.onbordingIndex].subTitle,
                    size: 17,
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.0485),
                  const RowWidgets(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
