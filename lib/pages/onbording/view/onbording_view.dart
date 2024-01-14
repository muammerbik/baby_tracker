import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/onbording/viewmodel/onbording_viewmodel.dart';
import 'package:baby_tracker/pages/onbording/widgets/stack_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  final onboardingViewmodel = locator<OnbordingViewModel>();

  @override
  void initState() {
    onboardingViewmodel.pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    onboardingViewmodel.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      body: Observer(
        builder: (context) => Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: onboardingViewmodel.pageController,
                onPageChanged: onboardingViewmodel.onPageChanged,
                physics: onboardingViewmodel.notGoBack
                    ? const PageScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                itemCount: onboardingViewmodel.OnbordingList.length,
                itemBuilder: (context, index) {
                  return StackWidgets(
                    onbordingIndex: index,
                  );
                },
              ),
            ),
            CustomElevatedButtonView(
              onTop: () {
                onboardingViewmodel.continueButtonTapped();
              },
              text: btnNext,
              color: btnBlue,
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0539),
          ],
        ),
      ),
    );
  }
}
