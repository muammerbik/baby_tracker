// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diaper_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiaperViewModel on _DiaperViewModelBase, Store {
  late final _$selectedStatusAtom =
      Atom(name: '_DiaperViewModelBase.selectedStatus', context: context);

  @override
  DiaperStatus? get selectedStatus {
    _$selectedStatusAtom.reportRead();
    return super.selectedStatus;
  }

  @override
  set selectedStatus(DiaperStatus? value) {
    _$selectedStatusAtom.reportWrite(value, super.selectedStatus, () {
      super.selectedStatus = value;
    });
  }

  late final _$selectedDiaperAtom =
      Atom(name: '_DiaperViewModelBase.selectedDiaper', context: context);

  @override
  DiaperChangeModel? get selectedDiaper {
    _$selectedDiaperAtom.reportRead();
    return super.selectedDiaper;
  }

  @override
  set selectedDiaper(DiaperChangeModel? value) {
    _$selectedDiaperAtom.reportWrite(value, super.selectedDiaper, () {
      super.selectedDiaper = value;
    });
  }

  late final _$isButtonEnabledDiaperAtom = Atom(
      name: '_DiaperViewModelBase.isButtonEnabledDiaper', context: context);

  @override
  bool get isButtonEnabledDiaper {
    _$isButtonEnabledDiaperAtom.reportRead();
    return super.isButtonEnabledDiaper;
  }

  @override
  set isButtonEnabledDiaper(bool value) {
    _$isButtonEnabledDiaperAtom.reportWrite(value, super.isButtonEnabledDiaper,
        () {
      super.isButtonEnabledDiaper = value;
    });
  }

  late final _$diaperTimeControllerAtom =
      Atom(name: '_DiaperViewModelBase.diaperTimeController', context: context);

  @override
  TextEditingController get diaperTimeController {
    _$diaperTimeControllerAtom.reportRead();
    return super.diaperTimeController;
  }

  @override
  set diaperTimeController(TextEditingController value) {
    _$diaperTimeControllerAtom.reportWrite(value, super.diaperTimeController,
        () {
      super.diaperTimeController = value;
    });
  }

  late final _$diaperNoteControllerAtom =
      Atom(name: '_DiaperViewModelBase.diaperNoteController', context: context);

  @override
  TextEditingController get diaperNoteController {
    _$diaperNoteControllerAtom.reportRead();
    return super.diaperNoteController;
  }

  @override
  set diaperNoteController(TextEditingController value) {
    _$diaperNoteControllerAtom.reportWrite(value, super.diaperNoteController,
        () {
      super.diaperNoteController = value;
    });
  }

  late final _$diaperListAtom =
      Atom(name: '_DiaperViewModelBase.diaperList', context: context);

  @override
  List<DiaperChangeModel> get diaperList {
    _$diaperListAtom.reportRead();
    return super.diaperList;
  }

  @override
  set diaperList(List<DiaperChangeModel> value) {
    _$diaperListAtom.reportWrite(value, super.diaperList, () {
      super.diaperList = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_DiaperViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$addDiaperChangeAsyncAction =
      AsyncAction('_DiaperViewModelBase.addDiaperChange', context: context);

  @override
  Future<void> addDiaperChange() {
    return _$addDiaperChangeAsyncAction.run(() => super.addDiaperChange());
  }

  late final _$getAllAsyncAction =
      AsyncAction('_DiaperViewModelBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_DiaperViewModelBase.delete', context: context);

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$upDateAsyncAction =
      AsyncAction('_DiaperViewModelBase.upDate', context: context);

  @override
  Future<void> upDate(String id) {
    return _$upDateAsyncAction.run(() => super.upDate(id));
  }

  late final _$_DiaperViewModelBaseActionController =
      ActionController(name: '_DiaperViewModelBase', context: context);

  @override
  void upDateButtonstatus() {
    final _$actionInfo = _$_DiaperViewModelBaseActionController.startAction(
        name: '_DiaperViewModelBase.upDateButtonstatus');
    try {
      return super.upDateButtonstatus();
    } finally {
      _$_DiaperViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool statusButtonTapped() {
    final _$actionInfo = _$_DiaperViewModelBaseActionController.startAction(
        name: '_DiaperViewModelBase.statusButtonTapped');
    try {
      return super.statusButtonTapped();
    } finally {
      _$_DiaperViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedStatus(DiaperStatus? status) {
    final _$actionInfo = _$_DiaperViewModelBaseActionController.startAction(
        name: '_DiaperViewModelBase.setSelectedStatus');
    try {
      return super.setSelectedStatus(status);
    } finally {
      _$_DiaperViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(DiaperChangeModel diaperChange) {
    final _$actionInfo = _$_DiaperViewModelBaseActionController.startAction(
        name: '_DiaperViewModelBase.add');
    try {
      return super.add(diaperChange);
    } finally {
      _$_DiaperViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedStatus: ${selectedStatus},
selectedDiaper: ${selectedDiaper},
isButtonEnabledDiaper: ${isButtonEnabledDiaper},
diaperTimeController: ${diaperTimeController},
diaperNoteController: ${diaperNoteController},
diaperList: ${diaperList}
    ''';
  }
}
