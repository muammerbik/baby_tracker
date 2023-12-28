import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
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
    sleepGetIt.initSlep();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidgets(text: "Sleep", size: 27, color: darkBlue),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          CustomTextFormField(
              onTap: () {
                informationGetIt.selectTime(
                    context, sleepGetIt.sleepFellController);
              },
              labelText: "Fell Sleep",
              controller: sleepGetIt.sleepFellController),
          SizedBox(
            height: 23,
          ),
          CustomTextFormField(
              onTap: () {
                informationGetIt.selectTime(
                    context, sleepGetIt.sleepWakeupController);
              },
              labelText: "Wake Up",
              controller: sleepGetIt.sleepWakeupController),
          SizedBox(
            height: 23,
          ),
          CustomTextFormField(
              hintText: "Note",
              controller: sleepGetIt.sleepNoteController,
              maxLines: 10),
          Spacer(),
          CustomElevatedButtonView(
              text: "Save",
              onTop: () async {
                if (sleepGetIt.selectedSlep == null) {
                  await sleepGetIt.addSleep();
                } else {
                  sleepGetIt.upDate(sleepGetIt.selectedSlep!.id);
                }

                Navigation.push(page: HomeView());
              },
              color: lightGrey),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
