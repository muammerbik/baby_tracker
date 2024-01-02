// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onbording_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnbordingViewModel on _OnbordingViewModelBase, Store {
  late final _$OnbordingListAtom =
      Atom(name: '_OnbordingViewModelBase.OnbordingList', context: context);

  @override
  List<OnbordingModel> get OnbordingList {
    _$OnbordingListAtom.reportRead();
    return super.OnbordingList;
  }

  @override
  set OnbordingList(List<OnbordingModel> value) {
    _$OnbordingListAtom.reportWrite(value, super.OnbordingList, () {
      super.OnbordingList = value;
    });
  }

  late final _$isOnbordingComplatedAtom = Atom(
      name: '_OnbordingViewModelBase.isOnbordingComplated', context: context);

  @override
  bool get isOnbordingComplated {
    _$isOnbordingComplatedAtom.reportRead();
    return super.isOnbordingComplated;
  }

  @override
  set isOnbordingComplated(bool value) {
    _$isOnbordingComplatedAtom.reportWrite(value, super.isOnbordingComplated,
        () {
      super.isOnbordingComplated = value;
    });
  }

  late final _$pageControllerAtom =
      Atom(name: '_OnbordingViewModelBase.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_OnbordingViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$notGoBackAtom =
      Atom(name: '_OnbordingViewModelBase.notGoBack', context: context);

  @override
  bool get notGoBack {
    _$notGoBackAtom.reportRead();
    return super.notGoBack;
  }

  @override
  set notGoBack(bool value) {
    _$notGoBackAtom.reportWrite(value, super.notGoBack, () {
      super.notGoBack = value;
    });
  }

  late final _$onbordingComplatedSetAsyncAction = AsyncAction(
      '_OnbordingViewModelBase.onbordingComplatedSet',
      context: context);

  @override
  Future<void> onbordingComplatedSet() {
    return _$onbordingComplatedSetAsyncAction
        .run(() => super.onbordingComplatedSet());
  }

  late final _$onbordingComlatedGetAsyncAction = AsyncAction(
      '_OnbordingViewModelBase.onbordingComlatedGet',
      context: context);

  @override
  Future<void> onbordingComlatedGet() {
    return _$onbordingComlatedGetAsyncAction
        .run(() => super.onbordingComlatedGet());
  }

  late final _$_OnbordingViewModelBaseActionController =
      ActionController(name: '_OnbordingViewModelBase', context: context);

  @override
  void onPageChanged(int value) {
    final _$actionInfo = _$_OnbordingViewModelBaseActionController.startAction(
        name: '_OnbordingViewModelBase.onPageChanged');
    try {
      return super.onPageChanged(value);
    } finally {
      _$_OnbordingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void continueButtonTapped() {
    final _$actionInfo = _$_OnbordingViewModelBaseActionController.startAction(
        name: '_OnbordingViewModelBase.continueButtonTapped');
    try {
      return super.continueButtonTapped();
    } finally {
      _$_OnbordingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
OnbordingList: ${OnbordingList},
isOnbordingComplated: ${isOnbordingComplated},
pageController: ${pageController},
currentIndex: ${currentIndex},
notGoBack: ${notGoBack}
    ''';
  }
}
