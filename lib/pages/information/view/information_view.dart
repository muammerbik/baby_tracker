import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/pages/information/widgets/add_images_widget.dart';
import 'package:baby_tracker/pages/information/widgets/information_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class InformationView extends StatefulWidget {
  const InformationView({Key? key}) : super(key: key);

  @override
  State<InformationView> createState() => _InformationViewState();
}

class _InformationViewState extends State<InformationView> {
  final informationGetIt = locator<InformationViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Observer(
        builder: (context) => Column(
          children: [
            SizedBox(height: DeviceConfig.screenHeight! * 0.0693),
            AddImageWidgets(),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0493),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: DeviceConfig.screenHeight! * 0.730,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: lightGrey, width: 1),
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0369),
                    InformationRow(),
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0369),
                    CustomTextFormField(
                      labelText: babyFullName,
                      controller: informationGetIt.nameController,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0369),
                    CustomTextFormField(
                      labelText: birthDate,
                      keyboardType: TextInputType.datetime,
                      onTap: () {
                        informationGetIt.selectDate(
                            context, informationGetIt.birthDateController);
                      },
                      controller: informationGetIt.birthDateController,
                    ),
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0369),
                    CustomTextFormField(
                      labelText: timeOfBirth,
                      keyboardType: TextInputType.number,
                      onTap: () {
                        informationGetIt.selectTime(
                            context, informationGetIt.timeofBirthController);
                      },
                      controller: informationGetIt.timeofBirthController,
                    ),
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0369),
                    CustomTextFormField(
                      labelText: dueDate,
                      keyboardType: TextInputType.number,
                      onTap: () {
                        informationGetIt.selectTime(
                            context, informationGetIt.dueDateController);
                      },
                      controller: informationGetIt.dueDateController,
                    ),
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0493),
                    CustomElevatedButtonView(
                      onTop: () {
                        // Butona tıklandığında yapılacak işlemler
                      },
                      text: continuee,
                      color: lightGrey,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
