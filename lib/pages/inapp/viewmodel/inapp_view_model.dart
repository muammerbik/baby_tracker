import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/pages/information/view/information_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'inapp_view_model.g.dart';

class InappViewModel = _InappViewModelBase with _$InappViewModel;

abstract class _InappViewModelBase with Store {
  @observable
  int selectedButtonIndex = -1;

  @observable
  bool isInappComplated = false;

  @action
  Future<void> InappButtonTapped(BuildContext context) async {
    await InappComplatedSet();
    await InappComplatedGet();
    if (selectedButtonIndex != -1 && isInappComplated) {
      Navigation.push(
        page: InformationView(),
      );
    } else if (selectedButtonIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(snackbarMassageInaap),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @action
  Future<void> InappComplatedSet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("isInappComplated", true);
    isInappComplated = true;
  }

  @action
  Future<void> InappComplatedGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isInappComplated = pref.getBool("isInappComplated") ?? false;
  }
}
