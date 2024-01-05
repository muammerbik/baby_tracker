import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/diaper_change/widgets/diaper_change_column.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DiaperChangeView extends StatefulWidget {
  const DiaperChangeView({super.key});

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
    super.initState();
  }

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
      body: Observer(
        builder: (context) => Column(
          children: [
            SizedBox(height: 15),
            CustomTextFormField(
                labelText: "Time",
                controller: diaperGetIt.diaperTimeController,
                onTap: () {
                  informationGetIt.selectTime(
                      context, diaperGetIt.diaperTimeController);
                },
                keyboardType: TextInputType.number),
            DiaperChangeColumn(),
            CustomTextFormField(
              hintText: "Note",
              controller: diaperGetIt.diaperNoteController,
              maxLines: 10,
            ),
            SizedBox(height: 20),
            CustomElevatedButtonView(
                text: "Save",
                onTop: () async {
                  if (diaperGetIt.isButtonEnabledDiaper) {
                    if (diaperGetIt.selectedDiaper == null) {
                      await diaperGetIt.addDiaperChange();
                      diaperGetIt.diaperTimeController.clear();
                      diaperGetIt.selectedStatus = null;
                      diaperGetIt.diaperNoteController.clear();
                    } else {
                      await diaperGetIt.upDate(diaperGetIt.selectedDiaper!.id);
                      diaperGetIt.diaperTimeController.clear();
                      diaperGetIt.selectedStatus = null;
                      diaperGetIt.diaperNoteController.clear();
                    }
                    Navigation.push(page: HomeView());
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Doğrulama Hatası"),
                          content: Text(
                              " Devam etmek için  lütfen tüm alanları  doldurun!!!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Tamam"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                color: lightblue)
          ],
        ),
      ),
    );
  }
}
