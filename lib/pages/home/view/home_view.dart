import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/calender/viewmodel/calender_viewmodel.dart';
import 'package:baby_tracker/pages/home/widgets/home_container.dart';
import 'package:baby_tracker/pages/home/widgets/home_row.dart';
import 'package:baby_tracker/pages/information/view/information_view.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final informationViewmodel = locator<InformationViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);

    return Scaffold(
      body: Observer(
        builder: (context) => Column(
          children: [
            SizedBox(height: DeviceConfig.screenHeight! * 0.0640),
            const HomeRow(),
            Observer(
              builder: (context) => TextButton(
                onPressed: () {
                  Navigation.push(
                    page: const InformationView(),
                  );
                },
                child: const TextWidgets(
                  text: editProfie,
                  size: 15,
                  color: darkBlue,
                ),
              ),
            ),
            Observer(
              builder: (context) => TextWidgets(
                  text: informationViewmodel.nameController.text,
                  size: 25,
                  color: purple),
            ),
            SizedBox(
              height: DeviceConfig.screenHeight! * 0.0100,
            ),
            Observer(
              builder: (context) => TextWidgets(
                text: informationViewmodel.birthDateController
                    .text, 
                size: 17,
                color: black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: DeviceConfig.screenHeight! * 0.0169,
            ),
            Observer(
              builder: (context) => const HomeContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
