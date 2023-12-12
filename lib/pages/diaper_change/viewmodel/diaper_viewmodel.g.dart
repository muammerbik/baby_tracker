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

  late final _$_DiaperViewModelBaseActionController =
      ActionController(name: '_DiaperViewModelBase', context: context);

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
  String toString() {
    return '''
selectedStatus: ${selectedStatus}
    ''';
  }
}
