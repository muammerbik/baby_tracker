// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:baby_tracker/companent/custom_button/custom_alert_dialog.dart';
import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/data/models/diaper_change_model.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/diaper_change/widgets/diaper_change_column.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';

class DiaperChangeView extends StatefulWidget {
  final DiaperChangeModel? diaperChangeModel;
  const DiaperChangeView({
    Key? key,
    this.diaperChangeModel,
  }) : super(key: key);

  @override
  State<DiaperChangeView> createState() => _DiaperChangeViewState();
}

class _DiaperChangeViewState extends State<DiaperChangeView> {
  final diaperGetIt = locator<DiaperViewModel>();
  final informationGetIt = locator<InformationViewModel>();

  @override
  void initState() {
    diaperGetIt.diaperTimeController
        .addListener(diaperGetIt.upDateButtonstatus);
    diaperGetIt.diaperNoteController
        .addListener(diaperGetIt.upDateButtonstatus);

    if (widget.diaperChangeModel != null) {
      diaperGetIt.diaperTimeController.text = widget.diaperChangeModel!.time;
      diaperGetIt.selectedStatus = DiaperStatus
          .values[int.parse(widget.diaperChangeModel!.diaperStatus)];
      diaperGetIt.diaperNoteController.text = widget.diaperChangeModel!.note;
    }
    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidgets(
          text: diaperChange,
          size: 27,
          color: lightblue,
        ),
      ),
      body: Observer(
        builder: (context) => Column(
          children: [
            SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
            CustomTextFormField(
                labelText: time,
                controller: diaperGetIt.diaperTimeController,
                onTap: () {
                  informationGetIt.selectTime(
                      context, diaperGetIt.diaperTimeController);
                },
                keyboardType: TextInputType.number),
            DiaperChangeColumn(),
            CustomTextFormField(
              hintText: note,
              controller: diaperGetIt.diaperNoteController,
              maxLines: 10,
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
            CustomElevatedButtonView(
                text: save,
                onTop: () async {
                  diaperGetIt.isDiaperChangeButtonTapped(context);
                },
                color: lightblue),
          ],
        ),
      ),
    );
  }
}
