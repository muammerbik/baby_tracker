import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class FeedingView extends StatefulWidget {
  const FeedingView({Key? key}) : super(key: key);

  @override
  State<FeedingView> createState() => _FeedingViewState();
}

class _FeedingViewState extends State<FeedingView> {
  TextEditingController timeController = TextEditingController();
  TextEditingController mlController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidgets(text: "Feeding", size: 27, color: darkBlue),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          CustomTextFormField(
            labelText: "Time",
            controller: timeController,
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 30),
          CustomTextFormField(
            labelText: "Amount(ml)",
            controller: mlController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 30),
          CustomTextFormField(
            hintText: "Note",
            controller: noteController,
            keyboardType: TextInputType.name,
            maxLines: 10,
          ),
          Spacer(),
          CustomElevatedButtonView(
            text: "Save",
            onTop: () {},
            color: lightGrey,
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
