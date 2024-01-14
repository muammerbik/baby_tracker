import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/pages/inapp/view/inapp_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'onbording_viewmodel.g.dart';

class OnbordingViewModel = _OnbordingViewModelBase with _$OnbordingViewModel;

abstract class _OnbordingViewModelBase with Store {
  
  @observable
  bool isOnbordingComplated = false;

  @observable
  PageController pageController = PageController();

  @observable
  int currentIndex = 0;

  @observable
  bool notGoBack = false;

  @action
  Future<void> onbordingComplatedSet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("isOnbordingComplated", true);
  }

  @action
  Future<void> onbordingComlatedGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isOnbordingComplated = pref.getBool("isOnbordingComplated") ?? false;
  }

  @action
  void continueButtonTapped() {
    if (currentIndex == OnbordingList.length - 1) {
      onbordingComplatedSet();
      Navigation.push(page: const InappView());
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  @action
  void onPageChanged(int value) {
    currentIndex = value;
  }

  @observable
  List<OnbordingModel> OnbordingList = [
    OnbordingModel(
      img: onboardingImg1,
      title: onboardingTitle1,
      subTitle: onboardingSubTitle1,
    ),
    OnbordingModel(
        img: onboardingImg2,
        title: onboardingTitle2,
        subTitle: onboardingSubTitle2),
    OnbordingModel(
        img: onboardingImg3,
        title: onboardingTitle3,
        subTitle: onboardingSubTiitle3),
  ];
}

class OnbordingModel {
  final String img;
  final String title;
  final String subTitle;
  OnbordingModel({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}
