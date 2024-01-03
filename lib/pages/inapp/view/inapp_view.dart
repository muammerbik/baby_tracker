import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/inapp/viewmodel/inapp_view_model.dart';
import 'package:baby_tracker/pages/inapp/widgets/inapp_button.dart';
import 'package:baby_tracker/pages/inapp/widgets/inapp_row_widgets.dart';
import 'package:baby_tracker/pages/information/view/information_view.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
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
                      page: InformationView(),
                    );
                  },
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
            // ...

            CustomElevatedButtonView(
              text: btnStart,
              onTop: () async {
                await inappGetIt.InappComplatedSet();
                await inappGetIt.InappComplatedGet();

                if (inappGetIt.selectedButtonIndex != -1 && // Değişiklik burada
                    inappGetIt.isInappComplated) {
                  Navigation.push(
                    page: InformationView(), 
                  );
                } else if (inappGetIt.selectedButtonIndex == -1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Lütfen,Uygun Premium paketi seçin !'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              color: btnBlue,
            ),

// ...
          ],
        ),
      ),
    );
  }
}
