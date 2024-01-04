import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/home/widgets/home_buttons.dart';
import 'package:baby_tracker/pages/home/widgets/home_container.dart';
import 'package:baby_tracker/pages/home/widgets/home_row.dart';
import 'package:baby_tracker/pages/information/view/information_view.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final InformationGetIt = locator<InformationViewModel>();
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: DeviceConfig.screenHeight! * 0.0640),
          HomeRow(),
          TextButton(
            onPressed: () {
              Navigation.push(page: InformationView());
            },
            child: TextWidgets(
              text: editProfie,
              size: 13,
              color: darkBlue,
            ),
          ),
          TextWidgets(
              text: InformationGetIt.nameController.text,
              size: 25,
              color: purple),
          TextWidgets(
            text: '44 Months 17 Days',
            size: 14,
            color: black,
          ),
          SizedBox(
            height: 25,
          ),
          HomeContainer(),
        ],
      ),
    );
  }
}
