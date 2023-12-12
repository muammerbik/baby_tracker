import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/pages/diaper_change/widgets/diaper_change_column.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class DiaperChangeView extends StatefulWidget {
  const DiaperChangeView({super.key});

  @override
  State<DiaperChangeView> createState() => _DiaperChangeViewState();
}

class _DiaperChangeViewState extends State<DiaperChangeView> {
  TextEditingController diaperTimeController = TextEditingController();
  TextEditingController diaperNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidgets(
          text: "Diaper Change",
          size: 27,
          color: lightblue,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          CustomTextFormField(
              labelText: "Time",
              controller: diaperTimeController,
              keyboardType: TextInputType.number),
          DiaperChangeColumn(),
          CustomTextFormField(
            hintText: "Note",
            controller: diaperNoteController,
            maxLines: 10,
          ),
          SizedBox(height: 20),
          CustomElevatedButtonView(text: "Save", onTop: () {}, color: lightGrey)
        ],
      ),
    );
  }
}
