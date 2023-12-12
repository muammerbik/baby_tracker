import 'package:mobx/mobx.dart';
part 'settings_viewmodel.g.dart';

class SettingViewModel = _SettingViewModelBase with _$SettingViewModel;

abstract class _SettingViewModelBase with Store {
  @observable
  List<SettingsData> settingsList = [
    SettingsData(leading: "assets/images/stng0.png", title: "Get Premium"),
    SettingsData(leading: "assets/images/stng1.png", title: "Rate Us"),
    SettingsData(leading: "assets/images/stng2.png", title: "Terms of Use"),
    SettingsData(leading: "assets/images/stng3.png", title: "Privacy Policy"),
    SettingsData(leading: "assets/images/stng4.png", title: "Contact Us"),
    SettingsData(leading: "assets/images/stng5.png", title: "Restore Purchase"),
  ];
  @observable
  int selectedIndex = -1;

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }
}

class SettingsData {
  final String leading;
  final String title;

  SettingsData({
    required this.leading,
    required this.title,
  });
}
