import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:baby_tracker/pages/inapp/view/inapp_view.dart';
import 'package:baby_tracker/pages/inapp/viewmodel/inapp_view_model.dart';
import 'package:baby_tracker/pages/information/view/information_view.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/pages/onbording/view/onbording_view.dart';
import 'package:baby_tracker/pages/onbording/viewmodel/onbording_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final onboardingViewmodel = locator<OnbordingViewModel>();
  final inappViewmodel = locator<InappViewModel>();
  final informationViewModel = locator<InformationViewModel>();

  @override
  initState() {
    onboardingViewmodel.onbordingComlatedGet();
    inappViewmodel.inappComplatedGet();
    informationViewModel.informationComlatedGet();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (onboardingViewmodel.isOnbordingComplated == true &&
            inappViewmodel.isInappComplated == true &&
            informationViewModel.isInformationComplated == true) {
          return const HomeView();
        } else if (onboardingViewmodel.isOnbordingComplated == true &&
            inappViewmodel.isInappComplated == true) {
          return const InformationView();
        } else if (onboardingViewmodel.isOnbordingComplated == true) {
          return const InappView();
        } else {
          return const OnbordingView();
        }
      },
    );
  }
}
