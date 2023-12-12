import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/inapp/viewmodel/inapp_view_model.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/pages/onbording/viewmodel/onbording_viewmodel.dart';
import 'package:baby_tracker/pages/settings/viewmodel/settings_viewmodel.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setupGetIt() {
  locator.registerSingleton<OnbordingViewModel>(OnbordingViewModel());
  locator.registerSingleton<InappViewModel>(InappViewModel());
  locator.registerSingleton<InformationViewModel>(InformationViewModel());
   locator.registerSingleton<DiaperViewModel>(DiaperViewModel());
    locator.registerSingleton<SettingViewModel>(SettingViewModel());
}
