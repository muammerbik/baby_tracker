// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/data/models/feeding_model.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';

class FeedingView extends StatefulWidget {
  final FeedingModel? feedingModel;
  const FeedingView({
    Key? key,
    this.feedingModel,
  }) : super(key: key);

  @override
  State<FeedingView> createState() => _FeedingViewState();
}

class _FeedingViewState extends State<FeedingView> {
  final feedingGetIt = locator<FeedingViewModel>();
  final informationGetIt = locator<InformationViewModel>();

  @override
  void initState() {
    feedingGetIt.timeController.addListener(feedingGetIt.updateButtonStatus);
    feedingGetIt.mlController.addListener(feedingGetIt.updateButtonStatus);
    feedingGetIt.noteController.addListener(feedingGetIt.updateButtonStatus);
    
     if (widget.feedingModel != null) {
      feedingGetIt.noteController.text = widget.feedingModel!.note;
      feedingGetIt.timeController.text = widget.feedingModel!.time;
      feedingGetIt.mlController.text = widget.feedingModel!.amount.toString();
    } 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigation.ofPop();
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: TextWidgets(text: feeding, size: 27, color: darkBlue),
      ),
      body: Observer(
        builder: (context) => Column(
          children: [
            SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
            CustomTextFormField(
              labelText: time,
              controller: feedingGetIt.timeController,
              keyboardType: TextInputType.name,
              onTap: () {
                informationGetIt.selectTime(
                  context,
                  feedingGetIt.timeController,
                );
              },
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
            CustomTextFormField(
              labelText: amount,
              controller: feedingGetIt.mlController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
            CustomTextFormField(
              hintText: note,
              controller: feedingGetIt.noteController,
              keyboardType: TextInputType.name,
              maxLines: 10,
            ),
            Spacer(),
            CustomElevatedButtonView(
                text: save,
                onTop: () async {
                  feedingGetIt.isFeedingButtonTapped(context);
                },
                color: darkPurple),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
          ],
        ),
      ),
    );
  }
}
