import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/local_data/sleep_local_storage.dart';
import 'package:baby_tracker/data/models/sleeep_model.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'sleep_viewmodel.g.dart';

class SleepViewModel = _SleepViewModelBase with _$SleepViewModel;

abstract class _SleepViewModelBase with Store {
  final sleepStorage = locator<SleepLocalStorageHive>();

  @observable
  TextEditingController sleepFellController = TextEditingController();

  @observable
  TextEditingController sleepWakeupController = TextEditingController();

  @observable
  TextEditingController sleepNoteController = TextEditingController();

  @observable
  List<SleepModel> sleepList = [];

  @action
  void add(SleepModel slepMoel) {
    sleepList = List.from(sleepList)..add(slepMoel);
  }

  @action
  Future<void> addSleep() async {
    try {
      var sleepModel = SleepModel(
          id: Uuid().v4(),
          fellSleep: sleepFellController.text,
          wakeUp: sleepWakeupController.text,
          note: sleepNoteController.text);

      await sleepBox.clear();
      //   await sleepBox.add(sleepModel);
      await sleepStorage.addSleep(sleepModel: sleepModel);
      add(sleepModel);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getAll() async {
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

/* 
  Future<void> getSleep() async {
    SleepModel sleepGet = sleepBox.get(0)!;
    sleepFellController.text = sleepGet.fellSleep;
    sleepWakeupController.text = sleepGet.wakeUp;
    sleepNoteController.text = sleepGet.note;
  } */
}
