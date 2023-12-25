import 'dart:io';
import 'dart:typed_data';

import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/models/information_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'information_viewmodel.g.dart';

class InformationViewModel = _InformationViewModelBase
    with _$InformationViewModel;

abstract class _InformationViewModelBase with Store {
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController birthDateController = TextEditingController();
  @observable
  TextEditingController timeofBirthController = TextEditingController();
  @observable
  TextEditingController dueDateController = TextEditingController();

  @action
  Future<void> addInformation() async {
    try {
      DateTime parsedBirthDate =
          DateFormat('dd/MM/yyyy').parse(birthDateController.text);
      String imagePath = imageFile?.path ?? "";
      Uint8List imageBytes = await _readFileAsBytes(imagePath);
      var model = InformationModel(
        id: Uuid().v4(),
        img: imageBytes,
        cinsiyet: girlImageVisible,
        fullName: nameController.text,
        birthDate: DateFormat('yyyy-MM-dd').format(parsedBirthDate),
        timeOfBirth: timeofBirthController.text,
        dueDate: dueDateController.text,
      );
      await informationBox.clear();
      await informationBox.add(model);

      print(informationBox.toMap().toString() + "veriler kaydedildi");
    } catch (e) {
      print("Hata: $e");
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
      nameController.text = lastInformation.fullName;
      birthDateController.text = lastInformation.birthDate;
      timeofBirthController.text = lastInformation.timeOfBirth;
      dueDateController.text = lastInformation.dueDate;
    }
  }

  @observable
  File? imageFile;

  @observable
  ImagePicker picker = ImagePicker();

  @observable
  bool girlImageVisible = false;
  @observable
  bool sonImageVisible = false;

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
  void toggleGirlImage() {
    girlImageVisible = !girlImageVisible;
    sonImageVisible = !girlImageVisible;
  }

  @action
  void toggleSonImage() {
    sonImageVisible = !sonImageVisible;
    girlImageVisible = !sonImageVisible;
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
