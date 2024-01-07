import 'package:baby_tracker/constants/app_strings.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'settings_viewmodel.g.dart';

class SettingViewModel = _SettingViewModelBase with _$SettingViewModel;

abstract class _SettingViewModelBase with Store {
  @observable
  int selectedIndex = -1;

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }

  @observable
  List<SettingsData> settingsList = [
    SettingsData(leading: settingsImg1, title: getPremiumm),
    SettingsData(leading: settingsImg2, title: rateUs),
    SettingsData(leading: settingsImg3, title: termsofUse),
    SettingsData(leading: settingsImg4, title: privaryPolicy),
    SettingsData(leading: settingsImg5, title: contactUs),
    SettingsData(leading: settingsImg6, title: restorePurchase),
  ];
}

class SettingsData {
  final String leading;
  final String title;

  SettingsData({
    required this.leading,
    required this.title,
  });
}
