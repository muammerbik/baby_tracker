// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationViewModel on _InformationViewModelBase, Store {
  late final _$nameControllerAtom =
      Atom(name: '_InformationViewModelBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$birthDateControllerAtom = Atom(
      name: '_InformationViewModelBase.birthDateController', context: context);

  @override
  TextEditingController get birthDateController {
    _$birthDateControllerAtom.reportRead();
    return super.birthDateController;
  }

  @override
  set birthDateController(TextEditingController value) {
    _$birthDateControllerAtom.reportWrite(value, super.birthDateController, () {
      super.birthDateController = value;
    });
  }

  late final _$timeofBirthControllerAtom = Atom(
      name: '_InformationViewModelBase.timeofBirthController',
      context: context);

  @override
  TextEditingController get timeofBirthController {
    _$timeofBirthControllerAtom.reportRead();
    return super.timeofBirthController;
  }

  @override
  set timeofBirthController(TextEditingController value) {
    _$timeofBirthControllerAtom.reportWrite(value, super.timeofBirthController,
        () {
      super.timeofBirthController = value;
    });
  }

  late final _$dueDateControllerAtom = Atom(
      name: '_InformationViewModelBase.dueDateController', context: context);

  @override
  TextEditingController get dueDateController {
    _$dueDateControllerAtom.reportRead();
    return super.dueDateController;
  }

  @override
  set dueDateController(TextEditingController value) {
    _$dueDateControllerAtom.reportWrite(value, super.dueDateController, () {
      super.dueDateController = value;
    });
  }

  late final _$isInformationComplatedAtom = Atom(
      name: '_InformationViewModelBase.isInformationComplated',
      context: context);

  @override
  bool get isInformationComplated {
    _$isInformationComplatedAtom.reportRead();
    return super.isInformationComplated;
  }

  @override
  set isInformationComplated(bool value) {
    _$isInformationComplatedAtom
        .reportWrite(value, super.isInformationComplated, () {
      super.isInformationComplated = value;
    });
  }

  late final _$imageFileAtom =
      Atom(name: '_InformationViewModelBase.imageFile', context: context);

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$pickerAtom =
      Atom(name: '_InformationViewModelBase.picker', context: context);

  @override
  ImagePicker get picker {
    _$pickerAtom.reportRead();
    return super.picker;
  }

  @override
  set picker(ImagePicker value) {
    _$pickerAtom.reportWrite(value, super.picker, () {
      super.picker = value;
    });
  }

  late final _$isGirlAtom =
      Atom(name: '_InformationViewModelBase.isGirl', context: context);

  @override
  bool get isGirl {
    _$isGirlAtom.reportRead();
    return super.isGirl;
  }

  @override
  set isGirl(bool value) {
    _$isGirlAtom.reportWrite(value, super.isGirl, () {
      super.isGirl = value;
    });
  }

  late final _$InformationComplatedSetAsyncAction = AsyncAction(
      '_InformationViewModelBase.InformationComplatedSet',
      context: context);

  @override
  Future<void> InformationComplatedSet() {
    return _$InformationComplatedSetAsyncAction
        .run(() => super.InformationComplatedSet());
  }

  late final _$InformationComlatedGetAsyncAction = AsyncAction(
      '_InformationViewModelBase.InformationComlatedGet',
      context: context);

  @override
  Future<void> InformationComlatedGet() {
    return _$InformationComlatedGetAsyncAction
        .run(() => super.InformationComlatedGet());
  }

  late final _$addInformationAsyncAction =
      AsyncAction('_InformationViewModelBase.addInformation', context: context);

  @override
  Future<void> addInformation() {
    return _$addInformationAsyncAction.run(() => super.addInformation());
  }

  late final _$initAsyncAction =
      AsyncAction('_InformationViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_readFileAsBytesAsyncAction = AsyncAction(
      '_InformationViewModelBase._readFileAsBytes',
      context: context);

  @override
  Future<Uint8List> _readFileAsBytes(String filePath) {
    return _$_readFileAsBytesAsyncAction
        .run(() => super._readFileAsBytes(filePath));
  }

  late final _$loadInformationAsyncAction = AsyncAction(
      '_InformationViewModelBase.loadInformation',
      context: context);

  @override
  Future<void> loadInformation() {
    return _$loadInformationAsyncAction.run(() => super.loadInformation());
  }

  late final _$selectTimeAsyncAction =
      AsyncAction('_InformationViewModelBase.selectTime', context: context);

  @override
  Future<void> selectTime(
      BuildContext context, TextEditingController controller) {
    return _$selectTimeAsyncAction
        .run(() => super.selectTime(context, controller));
  }

  late final _$selectDateAsyncAction =
      AsyncAction('_InformationViewModelBase.selectDate', context: context);

  @override
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) {
    return _$selectDateAsyncAction
        .run(() => super.selectDate(context, controller));
  }

  late final _$imgFromGalleryAsyncAction =
      AsyncAction('_InformationViewModelBase.imgFromGallery', context: context);

  @override
  Future imgFromGallery() {
    return _$imgFromGalleryAsyncAction.run(() => super.imgFromGallery());
  }

  late final _$imgFromCameraAsyncAction =
      AsyncAction('_InformationViewModelBase.imgFromCamera', context: context);

  @override
  Future imgFromCamera() {
    return _$imgFromCameraAsyncAction.run(() => super.imgFromCamera());
  }

  late final _$cropImageAsyncAction =
      AsyncAction('_InformationViewModelBase.cropImage', context: context);

  @override
  Future cropImage(File imgFile) {
    return _$cropImageAsyncAction.run(() => super.cropImage(imgFile));
  }

  late final _$_InformationViewModelBaseActionController =
      ActionController(name: '_InformationViewModelBase', context: context);

  @override
  void toggleGirlImage() {
    final _$actionInfo = _$_InformationViewModelBaseActionController
        .startAction(name: '_InformationViewModelBase.toggleGirlImage');
    try {
      return super.toggleGirlImage();
    } finally {
      _$_InformationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSonImage() {
    final _$actionInfo = _$_InformationViewModelBaseActionController
        .startAction(name: '_InformationViewModelBase.toggleSonImage');
    try {
      return super.toggleSonImage();
    } finally {
      _$_InformationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameController: ${nameController},
birthDateController: ${birthDateController},
timeofBirthController: ${timeofBirthController},
dueDateController: ${dueDateController},
isInformationComplated: ${isInformationComplated},
imageFile: ${imageFile},
picker: ${picker},
isGirl: ${isGirl}
    ''';
  }
}
