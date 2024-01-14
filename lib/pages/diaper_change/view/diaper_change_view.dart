// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker/data/models/diaper_change_model.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/diaper_change/widgets/diaper_change_column.dart';
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
  final diaperViewmodel = locator<DiaperViewModel>();
  final informationViewmodel = locator<InformationViewModel>();
  
  @override
  void initState() {
    diaperViewmodel.diaperTimeController
        .addListener(diaperViewmodel.upDateButtonstatus);
    diaperViewmodel.diaperNoteController
        .addListener(diaperViewmodel.upDateButtonstatus);

    if (widget.diaperChangeModel != null) {
      diaperViewmodel.diaperTimeController.text =
          widget.diaperChangeModel!.time;
      diaperViewmodel.selectedStatus = DiaperStatus
          .values[int.parse(widget.diaperChangeModel!.diaperStatus)];
      diaperViewmodel.diaperNoteController.text =
          widget.diaperChangeModel!.note;
      diaperViewmodel.selectedDiaper = widget.diaperChangeModel;
    } else {
      diaperViewmodel.selectedDiaper =
          null; // Yeni veri eklenirken seçili öğeyi temizle
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
        title: const TextWidgets(
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
                controller: diaperViewmodel.diaperTimeController,
                onTap: () {
                  informationViewmodel.selectTime(
                      context, diaperViewmodel.diaperTimeController);
                },
                keyboardType: TextInputType.number),
            const DiaperChangeColumn(),
            CustomTextFormField(
              hintText: note,
              controller: diaperViewmodel.diaperNoteController,
              maxLines: 10,
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0323),
            CustomElevatedButtonView(
                text: save,
                onTop: () async {
                  diaperViewmodel.isDiaperChangeButtonTapped(context);
                },
                color: lightblue),
          ],
        ),
      ),
    );
  }
}
