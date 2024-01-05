// settings_view.dart
import 'package:baby_tracker/constants/app_strings.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings",
            style: TextStyle(fontSize: 27, color: Color(0xFF4625C3))),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            for (int i = 0; i < settingsGetIt.settingsList.length; i++)
              Column(
                children: [
                  SettingsColumn(
                    leading: settingsGetIt.settingsList[i].leading,
                    title: settingsGetIt.settingsList[i].title,
                  ),
                  SizedBox(height: 15),
                ],
              ),
          
          ],
        ),
      ),
    );
  }
}
