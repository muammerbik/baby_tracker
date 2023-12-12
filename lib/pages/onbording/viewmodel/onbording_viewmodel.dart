import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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
    if (currentIndex == OnbordingList.length - 1) {}
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
