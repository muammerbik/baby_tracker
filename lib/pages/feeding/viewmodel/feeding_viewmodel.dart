import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/local_data/feeding_local_storage.dart';
import 'package:baby_tracker/data/models/feeding_model.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'feeding_viewmodel.g.dart';

class FeedingViewModel = _FeedingViewModelBase with _$FeedingViewModel;

abstract class _FeedingViewModelBase with Store {
  final feedingStorage = locator<FeedingLocalStorageHive>();

  _FeedingViewModelBase() {
    init();
  }

  @observable
  TextEditingController timeController = TextEditingController();
  @observable
  TextEditingController mlController = TextEditingController();
  @observable
  TextEditingController noteController = TextEditingController();

  @observable
  List<FeedingModel> feedList = [];

  @observable
  FeedingModel? selectedFeed;

  @action
  Future<void> init() async {
    await getAll();
  }

@action
Future<void> initGet()async{
  await getFeeding();
}


  @action
  void add(FeedingModel feed) {
    feedList = List.from(feedList)..add(feed);
  }

  @action
  Future<void> addFeeding() async {
    try {
      var feedmodel = FeedingModel(
          id: Uuid().v4(),
          time: timeController.text,
          amount: int.tryParse(mlController.text),
          note: noteController.text);
      feedingStorage.addFeeding(feedingModel: feedmodel);
      add(feedmodel);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getAll() async {
    feedList.clear();
    var data = await feedingStorage.getAllFeeding();
    feedList.addAll(data);
    print(feedList);
  }

  @action
  Future<void> delete(String id) async {
    try {
      FeedingModel feedToDelete = feedList.firstWhere((feed) => feed.id == id);
      await feedingStorage.deleteFeeding(feedModel: feedToDelete);
      feedList.remove(feedToDelete);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> upDate(String id) async {
    try {
      FeedingModel feedToUpdate = feedList.firstWhere((feed) => feed.id == id);
      feedToUpdate.time = timeController.text;
      feedToUpdate.amount = int.tryParse(mlController.text);
      feedToUpdate.note = noteController.text;
      await feedingStorage.upDateFeeding(feedModel: feedToUpdate);
      feedList = List.from(feedList);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getFeeding() async {
    if (feedingBox.isNotEmpty) {
      FeedingModel feedingGet = feedingBox.getAt(0)!;
      timeController.text = feedingGet.time;
      mlController.text = feedingGet.amount.toString();
      noteController.text = feedingGet.note;
    }
  }
  
}