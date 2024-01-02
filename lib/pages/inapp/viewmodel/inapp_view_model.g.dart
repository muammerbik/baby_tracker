// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inapp_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InappViewModel on _InappViewModelBase, Store {
  late final _$selectedButtonIndexAtom =
      Atom(name: '_InappViewModelBase.selectedButtonIndex', context: context);

  @override
  int get selectedButtonIndex {
    _$selectedButtonIndexAtom.reportRead();
    return super.selectedButtonIndex;
  }

  @override
  set selectedButtonIndex(int value) {
    _$selectedButtonIndexAtom.reportWrite(value, super.selectedButtonIndex, () {
      super.selectedButtonIndex = value;
    });
  }

  late final _$isInappComplatedAtom =
      Atom(name: '_InappViewModelBase.isInappComplated', context: context);

  @override
  bool get isInappComplated {
    _$isInappComplatedAtom.reportRead();
    return super.isInappComplated;
  }

  @override
  set isInappComplated(bool value) {
    _$isInappComplatedAtom.reportWrite(value, super.isInappComplated, () {
      super.isInappComplated = value;
    });
  }

  late final _$InappComplatedSetAsyncAction =
      AsyncAction('_InappViewModelBase.InappComplatedSet', context: context);

  @override
  Future<void> InappComplatedSet() {
    return _$InappComplatedSetAsyncAction.run(() => super.InappComplatedSet());
  }

  late final _$InappComplatedGetAsyncAction =
      AsyncAction('_InappViewModelBase.InappComplatedGet', context: context);

  @override
  Future<void> InappComplatedGet() {
    return _$InappComplatedGetAsyncAction.run(() => super.InappComplatedGet());
  }

  @override
  String toString() {
    return '''
selectedButtonIndex: ${selectedButtonIndex},
isInappComplated: ${isInappComplated}
    ''';
  }
}
