import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/pages/inapp/view/inapp_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'onbording_viewmodel.g.dart';

class OnbordingViewModel = _OnbordingViewModelBase with _$OnbordingViewModel;

abstract class _OnbordingViewModelBase with Store {
  @observable
  List<OnbordingModel> OnbordingList = [
    OnbordingModel(
      img: "assets/images/onbording1.png",
      title: "Track Your Baby's\nActivities with Ease",
      subTitle:
          "Get started with tracking your baby's\nfeedings, diaper changes, sleep patterns,\nand more...",
    ),
    OnbordingModel(
      img: "assets/images/onbording2.png",
      title: 'Learn About Your\nBaby',
      subTitle:
          "Customize your baby's profile, set\nreminders for important activities, and\nview detailed reports on your baby's rogress ",
    ),
    OnbordingModel(
        img: "assets/images/onbording3.png",
        title: 'Stay Connected \nwith Caregivers',
        subTitle:
            "Share access to your baby's tracker with\nfamily members, babysitters, or healthcare\nproviders "),
  ];




  @observable
  bool isOnbordingComplated = false;


  @action
  Future<void> onbordingComplatedSet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isOnbordingComplated", true);
  }


  @action
  Future<void> onbordingComlatedGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isOnbordingComplated = pref.getBool("isOnbordingComplated") ?? false;
  }







  @observable
  PageController pageController = PageController();

  @observable
  int currentIndex = 0;

  @observable
  bool notGoBack = false;

  @action
  void onPageChanged(int value) {
    currentIndex = value;
  }

  @action
  void continueButtonTapped() {
    if (currentIndex == OnbordingList.length - 1) {
      Navigation.push(page: InappView());
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }
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
