// settings_view.dart
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/settings/viewmodel/settings_viewmodel.dart';
import 'package:baby_tracker/pages/settings/widgets/settings_column.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final settingsGetIt = locator<SettingViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const TextWidgets(
            text: settings,
            size: 27,
            color: btnBlue,
          )),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: DeviceConfig.screenHeight! * 0.0120),
            for (int i = 0; i < settingsGetIt.settingsList.length; i++)
              Column(
                children: [
                  SettingsColumn(
                    leading: settingsGetIt.settingsList[i].leading,
                    title: settingsGetIt.settingsList[i].title,
                  ),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.0120),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
