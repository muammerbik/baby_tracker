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
  final onbordingGetIt = locator<OnbordingViewModel>();
  final inAppGetIt = locator<InappViewModel>();
  final informationGetIt = locator<InformationViewModel>();


  @override
  initState() {
    onbordingGetIt.onbordingComlatedGet();
    inAppGetIt.InappComplatedGet();
    informationGetIt.InformationComlatedGet();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (onbordingGetIt.isOnbordingComplated == true &&
            inAppGetIt.isInappComplated == true &&
            informationGetIt.isInformationComplated == true) {
          return HomeView();
        } else if (onbordingGetIt.isOnbordingComplated == true &&
            inAppGetIt.isInappComplated == true) {
          return InformationView();
        } else if (onbordingGetIt.isOnbordingComplated == true) {
          return InappView();
        } else {
          return OnbordingView();
        }
      },
    ); 
  }
}
