// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$ageAtom = Atom(name: '_HomeViewModelBase.age', context: context);

  @override
  String get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(String value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  late final _$calculateAgeAsyncAction =
      AsyncAction('_HomeViewModelBase.calculateAge', context: context);

  @override
  Future<void> calculateAge() {
    return _$calculateAgeAsyncAction.run(() => super.calculateAge());
  }

  late final _$initAsyncAction =
      AsyncAction('_HomeViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
age: ${age}
    ''';
  }
}
