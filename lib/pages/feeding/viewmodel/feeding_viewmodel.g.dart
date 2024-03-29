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

  late final _$feedListAtom =
      Atom(name: '_FeedingViewModelBase.feedList', context: context);

  @override
  List<FeedingModel> get feedList {
    _$feedListAtom.reportRead();
    return super.feedList;
  }

  @override
  set feedList(List<FeedingModel> value) {
    _$feedListAtom.reportWrite(value, super.feedList, () {
      super.feedList = value;
    });
  }

  late final _$selectedFeedAtom =
      Atom(name: '_FeedingViewModelBase.selectedFeed', context: context);

  @override
  FeedingModel? get selectedFeed {
    _$selectedFeedAtom.reportRead();
    return super.selectedFeed;
  }

  @override
  set selectedFeed(FeedingModel? value) {
    _$selectedFeedAtom.reportWrite(value, super.selectedFeed, () {
      super.selectedFeed = value;
    });
  }

  late final _$isButtonEnabledAtom =
      Atom(name: '_FeedingViewModelBase.isButtonEnabled', context: context);

  @override
  bool get isButtonEnabled {
    _$isButtonEnabledAtom.reportRead();
    return super.isButtonEnabled;
  }

  @override
  set isButtonEnabled(bool value) {
    _$isButtonEnabledAtom.reportWrite(value, super.isButtonEnabled, () {
      super.isButtonEnabled = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_FeedingViewModelBase.selectedIndex', context: context);

  @override
  int? get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int? value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$isFeedingButtonTappedAsyncAction = AsyncAction(
      '_FeedingViewModelBase.isFeedingButtonTapped',
      context: context);

  @override
  Future<void> isFeedingButtonTapped(BuildContext context) {
    return _$isFeedingButtonTappedAsyncAction
        .run(() => super.isFeedingButtonTapped(context));
  }

  late final _$initAsyncAction =
      AsyncAction('_FeedingViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$addFeedingAsyncAction =
      AsyncAction('_FeedingViewModelBase.addFeeding', context: context);

  @override
  Future<void> addFeeding() {
    return _$addFeedingAsyncAction.run(() => super.addFeeding());
  }

  late final _$getAllAsyncAction =
      AsyncAction('_FeedingViewModelBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_FeedingViewModelBase.delete', context: context);

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$upDateAsyncAction =
      AsyncAction('_FeedingViewModelBase.upDate', context: context);

  @override
  Future<void> upDate(String id) {
    return _$upDateAsyncAction.run(() => super.upDate(id));
  }

  late final _$_FeedingViewModelBaseActionController =
      ActionController(name: '_FeedingViewModelBase', context: context);

  @override
  void updateSelectedIndex(int index) {
    final _$actionInfo = _$_FeedingViewModelBaseActionController.startAction(
        name: '_FeedingViewModelBase.updateSelectedIndex');
    try {
      return super.updateSelectedIndex(index);
    } finally {
      _$_FeedingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearControllersFeeding() {
    final _$actionInfo = _$_FeedingViewModelBaseActionController.startAction(
        name: '_FeedingViewModelBase.clearControllersFeeding');
    try {
      return super.clearControllersFeeding();
    } finally {
      _$_FeedingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateButtonStatus() {
    final _$actionInfo = _$_FeedingViewModelBaseActionController.startAction(
        name: '_FeedingViewModelBase.updateButtonStatus');
    try {
      return super.updateButtonStatus();
    } finally {
      _$_FeedingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isFieldsFilled() {
    final _$actionInfo = _$_FeedingViewModelBaseActionController.startAction(
        name: '_FeedingViewModelBase.isFieldsFilled');
    try {
      return super.isFieldsFilled();
    } finally {
      _$_FeedingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(FeedingModel feed) {
    final _$actionInfo = _$_FeedingViewModelBaseActionController.startAction(
        name: '_FeedingViewModelBase.add');
    try {
      return super.add(feed);
    } finally {
      _$_FeedingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  FeedingModel getItem(String id) {
    final _$actionInfo = _$_FeedingViewModelBaseActionController.startAction(
        name: '_FeedingViewModelBase.getItem');
    try {
      return super.getItem(id);
    } finally {
      _$_FeedingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timeController: ${timeController},
mlController: ${mlController},
noteController: ${noteController},
feedList: ${feedList},
selectedFeed: ${selectedFeed},
isButtonEnabled: ${isButtonEnabled},
selectedIndex: ${selectedIndex}
    ''';
  }
}
