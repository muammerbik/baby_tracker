// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingViewModel on _SettingViewModelBase, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_SettingViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$settingsListAtom =
      Atom(name: '_SettingViewModelBase.settingsList', context: context);

  @override
  List<SettingsData> get settingsList {
    _$settingsListAtom.reportRead();
    return super.settingsList;
  }

  @override
  set settingsList(List<SettingsData> value) {
    _$settingsListAtom.reportWrite(value, super.settingsList, () {
      super.settingsList = value;
    });
  }

  late final _$_SettingViewModelBaseActionController =
      ActionController(name: '_SettingViewModelBase', context: context);

  @override
  void setSelectedIndex(int index) {
    final _$actionInfo = _$_SettingViewModelBaseActionController.startAction(
        name: '_SettingViewModelBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(index);
    } finally {
      _$_SettingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
settingsList: ${settingsList}
    ''';
  }
}
