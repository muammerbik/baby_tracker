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

  late final _$_SleepViewModelBaseActionController =
      ActionController(name: '_SleepViewModelBase', context: context);

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
  String toString() {
    return '''
sleepFellController: ${sleepFellController},
sleepWakeupController: ${sleepWakeupController},
sleepNoteController: ${sleepNoteController},
sleepList: ${sleepList}
    ''';
  }
}
