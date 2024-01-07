import 'package:baby_tracker/companent/custom_button/custom_alert_dialog.dart';
import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/pages/sleep/viewmodel/sleep_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class SleepView extends StatefulWidget {
  const SleepView({super.key});

  @override
  State<SleepView> createState() => _SleepViewState();
}

class _SleepViewState extends State<SleepView> {
  final sleepGetIt = locator<SleepViewModel>();
  final informationGetIt = locator<InformationViewModel>();
  @override
  void initState() {
    sleepGetIt.sleepFellController
        .addListener(sleepGetIt.updateButtonStatusSleep);
    sleepGetIt.sleepWakeupController
        .addListener(sleepGetIt.updateButtonStatusSleep);
    sleepGetIt.sleepNoteController
        .addListener(sleepGetIt.updateButtonStatusSleep);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidgets(text: sleep, size: 27, color: darkBlue),
      ),
      body: Column(
        children: [
          SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
          CustomTextFormField(
              onTap: () {
                informationGetIt.selectTime(
                    context, sleepGetIt.sleepFellController);
              },
              labelText: fellSleep,
              controller: sleepGetIt.sleepFellController),
          SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
          CustomTextFormField(
              onTap: () {
                informationGetIt.selectTime(
                    context, sleepGetIt.sleepWakeupController);
              },
              labelText: wakeApp,
              controller: sleepGetIt.sleepWakeupController),
          SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
          CustomTextFormField(
              hintText: note,
              controller: sleepGetIt.sleepNoteController,
              maxLines: 10),
          Spacer(),
          CustomElevatedButtonView(
              text: save,
              onTop: () async {
                sleepGetIt.isSleepButtonTapped(context);
              },
              color: darkBlue),
          SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
        ],
      ),
    );
  }
}
