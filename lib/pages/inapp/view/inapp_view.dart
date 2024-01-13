import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/inapp/viewmodel/inapp_view_model.dart';
import 'package:baby_tracker/pages/inapp/widgets/inapp_button.dart';
import 'package:baby_tracker/pages/inapp/widgets/inapp_row_widgets.dart';
import 'package:baby_tracker/pages/information/view/information_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InappView extends StatefulWidget {
  const InappView({super.key});

  @override
  State<InappView> createState() => _InappViewState();
}

class _InappViewState extends State<InappView> {
  final inappGetIt = locator<InappViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      body: Observer(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: DeviceConfig.screenHeight! * 0.0499),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: DeviceConfig.screenWidth! * 0.0467),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigation.push(
                      page: const InformationView(),
                    );
                  },
                  icon: Image.asset(
                    inappImgExit,
                    height: 15,
                    width: 15,
                  ),
                ),
              ),
            ),
            const Center(
              child: TextWidgets(text: getPremium, size: 27, color: btnBlue),
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0389),
            Image.asset(inappImageBaby,
                width: double.infinity,
                height: DeviceConfig.screenHeight! * 0.1229),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0403),
            const InappRowWidgets(
              size: 16,
              texts: [
                inappText1,
                inappText2,
                inappText3,
              ],
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0479),
            const InappButton(),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0423),
            CustomElevatedButtonView(
              text: btnStart,
              onTop: () async {
                inappGetIt.InappButtonTapped(context);
              },
              color: btnBlue,
            ),
          ],
        ),
      ),
    );
  }
}
