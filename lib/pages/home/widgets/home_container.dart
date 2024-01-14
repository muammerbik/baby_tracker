import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/pages/diaper_change/view/diaper_change_view.dart';
import 'package:baby_tracker/pages/feeding/view/feeding_view.dart';
import 'package:baby_tracker/pages/home/widgets/home_buttons.dart';
import 'package:baby_tracker/pages/sleep/view/sleep_view.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: DeviceConfig.screenHeight! * 0.575,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: lightGrey, width: 1),
          color: white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: DeviceConfig.screenHeight! * 0.0139,
            ),
            HomeButtons(
              color: darkPurple,
              title: feeding,
              img: feedingIcon,
              onTap: () {
                Navigation.push(
                  page: const FeedingView(),
                );
              },
            ),
            HomeButtons(
              color: lightblue,
              title: diaper,
              img: diaperIcon,
              onTap: () {
                Navigation.push(
                  page: const DiaperChangeView(),
                );
              },
            ),
            HomeButtons(
              color: darkBlue,
              title: sleep,
              img: sleepIcon,
              onTap: () {
                Navigation.push(
                  page: const SleepView(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
