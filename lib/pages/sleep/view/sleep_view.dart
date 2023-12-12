import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class SleepView extends StatefulWidget {
  const SleepView({super.key});

  @override
  State<SleepView> createState() => _SleepViewState();
}

class _SleepViewState extends State<SleepView> {
  TextEditingController sleepFellController = TextEditingController();
  TextEditingController sleepWakeupController = TextEditingController();
  TextEditingController sleepNoteController = TextEditingController();
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
              labelText: "Fell Sleep", controller: sleepFellController),
          SizedBox(
            height: 23,
          ),
          CustomTextFormField(
              labelText: "Wake Up", controller: sleepWakeupController),
          SizedBox(
            height: 23,
          ),
          CustomTextFormField(
              hintText: "Note", controller: sleepNoteController, maxLines: 10),
          Spacer(),
          CustomElevatedButtonView(
              text: "Save", onTop: () {}, color: lightGrey),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
