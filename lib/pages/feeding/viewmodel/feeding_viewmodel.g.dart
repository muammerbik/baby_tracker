// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeding_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedingViewModel on _FeedingViewModelBase, Store {
  late final _$timeControllerAtom =
      Atom(name: '_FeedingViewModelBase.timeController', context: context);

  @override
  TextEditingController get timeController {
    _$timeControllerAtom.reportRead();
    return super.timeController;
  }

  @override
  set timeController(TextEditingController value) {
    _$timeControllerAtom.reportWrite(value, super.timeController, () {
      super.timeController = value;
    });
  }

  late final _$mlControllerAtom =
      Atom(name: '_FeedingViewModelBase.mlController', context: context);

  @override
  TextEditingController get mlController {
    _$mlControllerAtom.reportRead();
    return super.mlController;
  }

  @override
  set mlController(TextEditingController value) {
    _$mlControllerAtom.reportWrite(value, super.mlController, () {
      super.mlController = value;
    });
  }

  late final _$noteControllerAtom =
      Atom(name: '_FeedingViewModelBase.noteController', context: context);

  @override
  TextEditingController get noteController {
    _$noteControllerAtom.reportRead();
    return super.noteController;
  }

  @override
  set noteController(TextEditingController value) {
    _$noteControllerAtom.reportWrite(value, super.noteController, () {
      super.noteController = value;
    });
  }

  @override
  String toString() {
    return '''
timeController: ${timeController},
mlController: ${mlController},
noteController: ${noteController}
    ''';
  }
}
