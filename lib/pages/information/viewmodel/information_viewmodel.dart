import 'dart:io';
import 'dart:typed_data';
import 'package:baby_tracker/companent/custom_button/custom_alert_dialog.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/local_data/information_local_storage.dart';
import 'package:baby_tracker/data/models/information_model.dart';
import 'package:baby_tracker/file/file.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'information_viewmodel.g.dart';

class InformationViewModel = _InformationViewModelBase
    with _$InformationViewModel;

abstract class _InformationViewModelBase with Store {
  final informationDB = locator<InformationLocalStorageHive>();

  _InformationViewModelBase() {
    init();
  }

  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController birthDateController = TextEditingController();
  @observable
  TextEditingController timeofBirthController = TextEditingController();
  @observable
  TextEditingController dueDateController = TextEditingController();
  @observable
  bool isInformationComplated = false;
  @observable
  File? imageFile;
  @observable
  ImagePicker picker = ImagePicker();

  @action
  Future<void> init() async {
    await loadInformation();
  }

  @observable
  bool? isGirl;

  @action
  void toggleGirlImage() {
    isGirl = true;
  }

  @action
  void toggleSonImage() {
    isGirl = false;
  }

  @observable
  InformationModel? selectedInformation;

  @action
  Future<void> InformationComplatedSet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isInformationComplated", true);
    isInformationComplated = true;
  }

  @action
  Future<void> InformationComlatedGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isInformationComplated = pref.getBool("isInformationComplated") ?? false;
  }

  @action
  Future<void> isInfoButtonTapped(BuildContext context, String pathh) async {
    if (pathh != null &&
        nameController.text.isNotEmpty &&
        birthDateController.text.isNotEmpty &&
        timeofBirthController.text.isNotEmpty &&
        dueDateController.text.isNotEmpty &&
        imageFile != null) {
      if (selectedInformation != null) {
        await upDate();
      } else {
        await addInformation();
      }

      InformationComplatedSet();
      Navigation.push(page: const HomeView());
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const CustomAlertDialog();
        },
      );
    }
  }

  @action
  Future<void> addInformation() async {
    try {
      DateTime parsedBirthDate =
          DateFormat('dd/MM/yyyy').parse(birthDateController.text);
      String imagePath = imageFile?.path ?? "";
      Uint8List imageBytes = await _readFileAsBytes(imagePath);
      final localImagePath =
          await FileHandler().saveFileToPhoneMemory("test.png", imageBytes);

      var model = InformationModel(
        id: const Uuid().v4(),
        img: localImagePath,
        cinsiyet: isGirl ?? false,
        fullName: nameController.text,
        birthDate: DateFormat('yyyy-MM-dd').format(parsedBirthDate),
        timeOfBirth: timeofBirthController.text,
        dueDate: dueDateController.text,
      );
      await informationBox.clear();
      informationDB.addInformation(informationModel: model);
    } catch (e) {
      print("Hata: $e");
    }
  }

  @action
  Future<void> upDate() async {
    try {
      selectedInformation!.cinsiyet = isGirl!;
      selectedInformation!.fullName = nameController.text;
      selectedInformation!.birthDate = birthDateController.text;
      selectedInformation!.timeOfBirth = timeofBirthController.text;
      selectedInformation!.dueDate = dueDateController.text;

      if (imageFile != null) {
        Uint8List imageBytes = await _readFileAsBytes(imageFile!.path);
        final localImagePath =
            await FileHandler().saveFileToPhoneMemory("test.png", imageBytes);
        selectedInformation!.img = localImagePath;
      }

      await informationDB.upDateInformation(
          informationModel: selectedInformation!);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<Uint8List> _readFileAsBytes(String filePath) async {
    try {
      File file = File(filePath);
      Uint8List bytes = await file.readAsBytes();
      return bytes;
    } catch (e) {
      print("Dosya okuma hatası: $e");
      return Uint8List(0);
    }
  }

  @action
  Future<void> loadInformation() async {
    if (informationBox.isNotEmpty) {
      InformationModel lastInformation = informationBox.getAt(0)!;
      selectedInformation = lastInformation;
      nameController.text = lastInformation.fullName;
      imageFile = File(lastInformation.img!);
      isGirl = lastInformation.cinsiyet;
      birthDateController.text = lastInformation.birthDate;
      timeofBirthController.text = lastInformation.timeOfBirth;
      dueDateController.text = lastInformation.dueDate;
    }
  }

  @action
  Future<void> selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      controller.text = picked.format(context);
    }
  }

  @action
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final String formattedDate = formatter.format(picked);
      controller.text = formattedDate;
    }
  }

  @action
  imgFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then(
      (value) {
        if (value != null) {
          cropImage(File(value.path));
        }
      },
    );
  }

  @action
  imgFromCamera() async {
    await picker.pickImage(source: ImageSource.camera, imageQuality: 50).then(
      (value) {
        if (value != null) {
          cropImage(File(value.path));
        }
      },
    );
  }

  @action
  cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Image Cropper",
          toolbarColor: btnBlue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: "Image Cropper",
        ),
      ],
    );

    if (croppedFile != null) {
      imageCache.clear();

      imageFile = File(croppedFile.path);
    }
  }
}
