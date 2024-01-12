// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SleepViewModel on _SleepViewModelBase, Store {
  late final _$sleepFellControllerAtom =
      Atom(name: '_SleepViewModelBase.sleepFellController', context: context);

  @override
  TextEditingController get sleepFellController {
    _$sleepFellControllerAtom.reportRead();
    return super.sleepFellController;
  }

  @override
  set sleepFellController(TextEditingController value) {
    _$sleepFellControllerAtom.reportWrite(value, super.sleepFellController, () {
      super.sleepFellController = value;
    });
  }

  late final _$sleepWakeupControllerAtom =
      Atom(name: '_SleepViewModelBase.sleepWakeupController', context: context);

  @override
  TextEditingController get sleepWakeupController {
    _$sleepWakeupControllerAtom.reportRead();
    return super.sleepWakeupController;
  }

  @override
  set sleepWakeupController(TextEditingController value) {
    _$sleepWakeupControllerAtom.reportWrite(value, super.sleepWakeupController,
        () {
      super.sleepWakeupController = value;
    });
  }

  late final _$sleepNoteControllerAtom =
      Atom(name: '_SleepViewModelBase.sleepNoteController', context: context);

  @override
  TextEditingController get sleepNoteController {
    _$sleepNoteControllerAtom.reportRead();
    return super.sleepNoteController;
  }

  @override
  set sleepNoteController(TextEditingController value) {
    _$sleepNoteControllerAtom.reportWrite(value, super.sleepNoteController, () {
      super.sleepNoteController = value;
    });
  }

  late final _$sleepListAtom =
      Atom(name: '_SleepViewModelBase.sleepList', context: context);

  @override
  List<SleepModel> get sleepList {
    _$sleepListAtom.reportRead();
    return super.sleepList;
  }

  @override
  set sleepList(List<SleepModel> value) {
    _$sleepListAtom.reportWrite(value, super.sleepList, () {
      super.sleepList = value;
    });
  }

  late final _$selectedSlepAtom =
      Atom(name: '_SleepViewModelBase.selectedSlep', context: context);

  @override
  SleepModel? get selectedSlep {
    _$selectedSlepAtom.reportRead();
    return super.selectedSlep;
  }

  @override
  set selectedSlep(SleepModel? value) {
    _$selectedSlepAtom.reportWrite(value, super.selectedSlep, () {
      super.selectedSlep = value;
    });
  }

  late final _$isButtonEnabledSleepAtom =
      Atom(name: '_SleepViewModelBase.isButtonEnabledSleep', context: context);

  @override
  bool get isButtonEnabledSleep {
    _$isButtonEnabledSleepAtom.reportRead();
    return super.isButtonEnabledSleep;
  }

  @override
  set isButtonEnabledSleep(bool value) {
    _$isButtonEnabledSleepAtom.reportWrite(value, super.isButtonEnabledSleep,
        () {
      super.isButtonEnabledSleep = value;
    });
  }

  late final _$sleepSelectIndexAtom =
      Atom(name: '_SleepViewModelBase.sleepSelectIndex', context: context);

  @override
  int? get sleepSelectIndex {
    _$sleepSelectIndexAtom.reportRead();
    return super.sleepSelectIndex;
  }

  @override
  set sleepSelectIndex(int? value) {
    _$sleepSelectIndexAtom.reportWrite(value, super.sleepSelectIndex, () {
      super.sleepSelectIndex = value;
    });
  }

  late final _$initSlepAsyncAction =
      AsyncAction('_SleepViewModelBase.initSlep', context: context);

  @override
  Future<void> initSlep() {
    return _$initSlepAsyncAction.run(() => super.initSlep());
  }

  late final _$initAsyncAction =
      AsyncAction('_SleepViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$isSleepButtonTappedAsyncAction =
      AsyncAction('_SleepViewModelBase.isSleepButtonTapped', context: context);

  @override
  Future<void> isSleepButtonTapped(BuildContext context) {
    return _$isSleepButtonTappedAsyncAction
        .run(() => super.isSleepButtonTapped(context));
  }

  late final _$addSleepAsyncAction =
      AsyncAction('_SleepViewModelBase.addSleep', context: context);

  @override
  Future<void> addSleep() {
    return _$addSleepAsyncAction.run(() => super.addSleep());
  }

  late final _$getAllAsyncAction =
      AsyncAction('_SleepViewModelBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_SleepViewModelBase.delete', context: context);

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$upDateAsyncAction =
      AsyncAction('_SleepViewModelBase.upDate', context: context);

  @override
  Future<void> upDate(String id) {
    return _$upDateAsyncAction.run(() => super.upDate(id));
  }

  late final _$getSleepAsyncAction =
      AsyncAction('_SleepViewModelBase.getSleep', context: context);

  @override
  Future<void> getSleep() {
    return _$getSleepAsyncAction.run(() => super.getSleep());
  }

  late final _$_SleepViewModelBaseActionController =
      ActionController(name: '_SleepViewModelBase', context: context);

  @override
  void updateSelectedIndex(int index) {
    final _$actionInfo = _$_SleepViewModelBaseActionController.startAction(
        name: '_SleepViewModelBase.updateSelectedIndex');
    try {
      return super.updateSelectedIndex(index);
    } finally {
      _$_SleepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateButtonStatusSleep() {
    final _$actionInfo = _$_SleepViewModelBaseActionController.startAction(
        name: '_SleepViewModelBase.updateButtonStatusSleep');
    try {
      return super.updateButtonStatusSleep();
    } finally {
      _$_SleepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isFiildsFeel() {
    final _$actionInfo = _$_SleepViewModelBaseActionController.startAction(
        name: '_SleepViewModelBase.isFiildsFeel');
    try {
      return super.isFiildsFeel();
    } finally {
      _$_SleepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(SleepModel slepMoel) {
    final _$actionInfo = _$_SleepViewModelBaseActionController.startAction(
        name: '_SleepViewModelBase.add');
    try {
      return super.add(slepMoel);
    } finally {
      _$_SleepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearControlersSleep() {
    final _$actionInfo = _$_SleepViewModelBaseActionController.startAction(
        name: '_SleepViewModelBase.clearControlersSleep');
    try {
      return super.clearControlersSleep();
    } finally {
      _$_SleepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  SleepModel getItemSlep(String id) {
    final _$actionInfo = _$_SleepViewModelBaseActionController.startAction(
        name: '_SleepViewModelBase.getItemSlep');
    try {
      return super.getItemSlep(id);
    } finally {
      _$_SleepViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sleepFellController: ${sleepFellController},
sleepWakeupController: ${sleepWakeupController},
sleepNoteController: ${sleepNoteController},
sleepList: ${sleepList},
selectedSlep: ${selectedSlep},
isButtonEnabledSleep: ${isButtonEnabledSleep},
sleepSelectIndex: ${sleepSelectIndex}
    ''';
  }
}
