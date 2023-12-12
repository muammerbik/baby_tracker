// settings_column.dart
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
import 'package:baby_tracker/pages/settings/viewmodel/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingsColumn extends StatefulWidget {
  final String leading;
  final String title;

  const SettingsColumn({
    Key? key,
    required this.leading,
    required this.title,
  }) : super(key: key);

  @override
  State<SettingsColumn> createState() => _SettingsColumnState();
}

class _SettingsColumnState extends State<SettingsColumn> {
  final settingsGetIt = locator<SettingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => GestureDetector(
        onTap: () {
          settingsGetIt.setSelectedIndex(
            settingsGetIt.settingsList.indexOf(
              settingsGetIt.settingsList
                  .firstWhere((element) => element.title == widget.title),
            ),
          );
        },
        child: Container(
          width: 380,
          height: settingsGetIt.selectedIndex ==
                  settingsGetIt.settingsList.indexOf(
                    settingsGetIt.settingsList
                        .firstWhere((element) => element.title == widget.title),
                  )
              ? 75
              : 60,
          decoration: ShapeDecoration(
            color: settingsGetIt.selectedIndex ==
                    settingsGetIt.settingsList.indexOf(
                      settingsGetIt.settingsList.firstWhere(
                          (element) => element.title == widget.title),
                    )
                ? Color(0xFF4625C3)
                : lightGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: ListTile(
              leading: Image.asset(
                widget.leading,
                color: settingsGetIt.selectedIndex ==
                        settingsGetIt.settingsList.indexOf(
                          settingsGetIt.settingsList.firstWhere(
                              (element) => element.title == widget.title),
                        )
                    ? white
                    : black,
              ),
              title: TextWidgets(
                text: widget.title,
                size: settingsGetIt.selectedIndex ==
                        settingsGetIt.settingsList.indexOf(
                          settingsGetIt.settingsList.firstWhere(
                              (element) => element.title == widget.title),
                        )
                    ? 20
                    : 14,
                color: settingsGetIt.selectedIndex ==
                        settingsGetIt.settingsList.indexOf(
                          settingsGetIt.settingsList.firstWhere(
                              (element) => element.title == widget.title),
                        )
                    ? Colors.white
                    : black,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: settingsGetIt.selectedIndex ==
                        settingsGetIt.settingsList.indexOf(
                          settingsGetIt.settingsList.firstWhere(
                              (element) => element.title == widget.title),
                        )
                    ? Colors.grey
                    : black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
