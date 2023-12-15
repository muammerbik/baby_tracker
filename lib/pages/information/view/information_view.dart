import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:baby_tracker/pages/information/information_model.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/pages/information/widgets/add_images_widget.dart';
import 'package:baby_tracker/pages/information/widgets/information_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class InformationView extends StatefulWidget {
  const InformationView({Key? key}) : super(key: key);

  @override
  State<InformationView> createState() => _InformationViewState();
}

class _InformationViewState extends State<InformationView> {
  final informationGetIt = locator<InformationViewModel>();

  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController timeofBirthController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Observer(
        builder: (context) => Column(
          children: [
            SizedBox(height: DeviceConfig.screenHeight! * 0.0453),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigation.push(
                          page: HomeView(),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios))),
            ),
            AddImageWidgets(),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0493),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: DeviceConfig.screenHeight! * 0.690,
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
                      controller: nameController,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0369),
                    CustomTextFormField(
                      labelText: birthDate,
                      keyboardType: TextInputType.datetime,
                      onTap: () {
                        informationGetIt.selectDate(
                            context, birthDateController);
                      },
                      controller: birthDateController,
                    ),
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0369),
                    CustomTextFormField(
                      labelText: timeOfBirth,
                      keyboardType: TextInputType.number,
                      onTap: () {
                        informationGetIt.selectTime(
                            context, timeofBirthController);
                      },
                      controller: timeofBirthController,
                    ),
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0369),
                    CustomTextFormField(
                      labelText: dueDate,
                      keyboardType: TextInputType.number,
                      onTap: () {
                        informationGetIt.selectTime(context, dueDateController);
                      },
                      controller: dueDateController,
                    ),
                    SizedBox(height: DeviceConfig.screenHeight! * 0.0493),
                    CustomElevatedButtonView(
                      onTop: () async {
                        addHive();
                        Navigation.push(page: HomeView());
                      },
                      text: continuee,
                      color: lightGrey,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> addHive() async {
    try {
      var box = Hive.box<InformationModel>("informationBox");
      DateTime parsedBirthDate =
          DateFormat('dd/MM/yyyy').parse(birthDateController.text);
      var model = InformationModel(
        id: Uuid().v4(),
        img: informationGetIt.imageFile.toString(),
        cinsiyet: informationGetIt.girlImageVisible,
        fullName: nameController.text,
        birthDate: DateFormat('yyyy-MM-dd').format(parsedBirthDate),
        timeOfBirth: timeofBirthController.text,
        dueDate: dueDateController.text,
      );
      await box.put(model.id, model);
    

      print(box.toMap().toString());
    } catch (e) {
      print("Hata: $e");
    }
  }
}
