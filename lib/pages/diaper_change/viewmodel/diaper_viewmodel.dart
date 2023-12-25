import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/local_data/diaper_local_storage.dart';
import 'package:baby_tracker/data/models/diaper_change_model.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'diaper_viewmodel.g.dart';

enum DiaperStatus { Wet, Dirty, Mixed, Dry }

class DiaperViewModel = _DiaperViewModelBase with _$DiaperViewModel;

abstract class _DiaperViewModelBase with Store {
  final diaperStoragee = locator<DiaperLocalStorageHive>();

  @observable
  DiaperStatus? selectedStatus;

  @action
  void setSelectedStatus(DiaperStatus? status) {
    selectedStatus = status;
  }

  @observable
  TextEditingController diaperTimeController = TextEditingController();
  @observable
  TextEditingController diaperNoteController = TextEditingController();

  @observable
  List<DiaperChangeModel> diaperList = [];

  @action
  void add(DiaperChangeModel diaperChange) {
    diaperList = List.from(diaperList)..add(diaperChange);
  }

  @action
  Future<void> addDiaperChange() async {
    try {
      var diaperModel = DiaperChangeModel(
          id: Uuid().v1(),
          time: diaperTimeController.text,
          diaperStatus: selectedStatus!.index.toString(),
          note: diaperNoteController.text);

      await diaperBox.clear();
      //  await diaperBox.add(diaperModel);
      await diaperStoragee.addDiaper(diaperChangeModel: diaperModel);
      add(diaperModel);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getAll() async {
    var data = await diaperStoragee.getAllDiaper();
    diaperList.addAll(data);
    print(diaperList);
  }

  @action
  Future<void> delete(String id) async {
    try {
      DiaperChangeModel diaperToDelete =
          diaperList.firstWhere((feed) => feed.id == id);
      await diaperStoragee.deleteDiaper(diaperChangeModel: diaperToDelete);
      diaperList.remove(diaperToDelete);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> upDate(String id) async {
    try {
      DiaperChangeModel diaperToUpdate =
          diaperList.firstWhere((feed) => feed.id == id);
      diaperToUpdate.time = diaperTimeController.text;
      //  diaperToUpdate.amount = int.tryParse(mlController.text);
      diaperToUpdate.note = diaperNoteController.text;
      await diaperStoragee.upDateDiaper(diaperChangeModel: diaperToUpdate);
      diaperList = List.from(diaperList);
    } catch (e) {
      print(e);
    }
  }

/* 
  Future<void> getDiaperChange() async {
    DiaperChangeModel diaperGet = diaperBox.get(0)!;
    diaperTimeController.text = diaperGet.time;
    diaperNoteController.text = diaperGet.note;
    
  } */
}
