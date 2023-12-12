import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:baby_tracker/pages/inapp/widgets/inapp_button.dart';
import 'package:baby_tracker/pages/inapp/widgets/inapp_row_widgets.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InappView extends StatefulWidget {
  const InappView({super.key});

  @override
  State<InappView> createState() => _InappViewState();
}

class _InappViewState extends State<InappView> {
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
                  onPressed: () { Navigation.push(page: HomeView());},
                  icon: Image.asset(
                    "assets/images/inapp3.png",
                    height: 15,
                    width: 15,
                  ),
                ),
              ),
            ),
            Center(
              child: TextWidgets(text: getPremium, size: 27, color: btnBlue),
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0389),
            Image.asset("assets/images/inapp1.png",
                width: double.infinity,
                height: DeviceConfig.screenHeight! * 0.1229),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0403),
            InappRowWidgets(
              size: 16,
              texts: [
                inappText1,
                inappText2,
                inappText3,
              ],
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0479),
            InappButton(),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0423),
            CustomElevatedButtonView(
              text: btnStart,
              onTop: () {
               
              },
              color: btnBlue,
            )
          ],
        ),
      ),
    );
  }
}
