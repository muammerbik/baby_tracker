import 'package:baby_tracker/companent/custom_button/custom_alert_dialog.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/local_data/sleep_local_storage.dart';
import 'package:baby_tracker/data/models/sleeep_model.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'sleep_viewmodel.g.dart';

class SleepViewModel = _SleepViewModelBase with _$SleepViewModel;

abstract class _SleepViewModelBase with Store {
  final sleepStorage = locator<SleepLocalStorageHive>();

  _SleepViewModelBase() {
    init();
  }

  @observable
  TextEditingController sleepFellController = TextEditingController();
  @observable
  TextEditingController sleepWakeupController = TextEditingController();
  @observable
  TextEditingController sleepNoteController = TextEditingController();
  @observable
  List<SleepModel> sleepList = [];
  @observable
  SleepModel? selectedSlep;
  @observable
  bool isButtonEnabledSleep = false;

  @observable
  int? sleepSelectIndex;

  @action
  void updateSelectedIndex(int index) {
    if (sleepSelectIndex == index) {
      sleepSelectIndex = null;
    } else {
      sleepSelectIndex = index;
    }
  }

  @action
  Future<void> initSlep() async {
    await getSleep();
  }

  @action
  Future<void> init() async {
    await getAll();
  }

  @action
  void updateButtonStatusSleep() {
    isButtonEnabledSleep = isFiildsFeel();
  }

  @action
  bool isFiildsFeel() {
    return sleepFellController.text.isNotEmpty &&
        sleepWakeupController.text.isNotEmpty &&
        sleepNoteController.text.isNotEmpty;
  }

  @action
  void add(SleepModel slepMoel) {
    sleepList = List.from(sleepList)..insert(0, slepMoel);
  }

  @action
  void clearControlersSleep() {
    sleepFellController.clear();
    sleepWakeupController.clear();
    sleepNoteController.clear();
  }

 
@action
Future<void> isSleepButtonTapped(BuildContext context) async {
  if (isButtonEnabledSleep) {
    if (selectedSlep == null) {
      await addSleep();
    } else {
      upDate(selectedSlep!.id);
    }

    Navigation.push(page: HomeView());
    clearControlersSleep();
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog();
      },
    );
  }
}


  @action
  SleepModel getItemSlep(String id) {
    return sleepList.firstWhere((feed) => feed.id == id);
  }


  @action
  Future<void> addSleep() async {
    try {
      var sleepModel = SleepModel(
          id: Uuid().v1(),
          fellSleep: sleepFellController.text,
          wakeUp: sleepWakeupController.text,
          note: sleepNoteController.text);
      await sleepStorage.addSleep(sleepModel: sleepModel);
      add(sleepModel);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getAll() async {
    sleepList.clear();
    var data = await sleepStorage.getAllSSleep();
    sleepList.addAll(data);
    print(sleepList);
  }

  @action
  Future<void> delete(String id) async {
    try {
      SleepModel sleepToDelete = sleepList.firstWhere((feed) => feed.id == id);
      await sleepStorage.deleteSleep(sleepModel: sleepToDelete);
      sleepList.remove(sleepToDelete);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> upDate(String id) async {
    try {
      SleepModel sleepToUpdate = sleepList.firstWhere((feed) => feed.id == id);
      sleepToUpdate.fellSleep = sleepFellController.text;
      sleepToUpdate.wakeUp = sleepWakeupController.text;
      sleepToUpdate.note = sleepNoteController.text;
      await sleepStorage.upDateSleep(sleepModel: sleepToUpdate);
      sleepList = List.from(sleepList);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getSleep() async {
    if (sleepBox.isNotEmpty) {
      SleepModel sleepGet = sleepBox.getAt(0)!;
      sleepFellController.text = sleepGet.fellSleep;
      sleepWakeupController.text = sleepGet.wakeUp;
      sleepNoteController.text = sleepGet.note;
    }
  }
}
