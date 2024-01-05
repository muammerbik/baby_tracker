import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  /* @observable
  int premiumValue = 2;

  @action
  Future<int> premiumCompletedSet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var prValue = await premiumComplatedGet();
    if (prValue > 0) {
      prValue--;
      await pref.setInt("premiumValue", prValue);
    }
    premiumValue = prValue;
    return prValue;
  }

  @action
  Future<int> premiumComplatedGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    premiumValue = pref.getInt("premiumValue") ?? 2;
    return premiumValue;
  } */
}

class SettingsData {
  final String leading;
  final String title;

  SettingsData({
    required this.leading,
    required this.title,
  });
}
