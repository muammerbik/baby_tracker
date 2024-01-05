// settings_column.dart
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/inapp/view/inapp_view.dart';
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
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
    final isFirstElement = settingsGetIt.settingsList.isNotEmpty &&
        widget.title == settingsGetIt.settingsList.first.title;

    return Observer(
      builder: (context) => GestureDetector(
        onTap: () {
          if (isFirstElement) {
            Navigation.push(page: InappView());
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: 380,
            height: isFirstElement ? 70 : 60,
            decoration: ShapeDecoration(
              color: isFirstElement ? Color(0xFF4625C3) : Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                leading: Image.asset(
                  widget.leading,
                  color: isFirstElement ? white : black,
                ),
                title: TextWidgets(
                  text: widget.title,
                  size: isFirstElement ? 20 : 16,
                  color: isFirstElement ? white : black,
                  textAlign: TextAlign.start,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: isFirstElement ? white : black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
