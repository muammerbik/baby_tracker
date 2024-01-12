import 'package:baby_tracker/companent/custom_button/custom_alert_dialog.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/local_data/feeding_local_storage.dart';
import 'package:baby_tracker/data/models/feeding_model.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
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

  @observable
  bool isButtonEnabled = false;

  @observable
  int? selectedIndex;

  @action
  void updateSelectedIndex(int index) {
    if (selectedIndex == index) {
      selectedIndex = null;
    } else {
      selectedIndex = index;
    }
  }

  @action
  void clearControllersFeeding() {
    timeController.clear();
    mlController.clear();
    noteController.clear();
  }

  @action
  Future<void> isFeedingButtonTapped(BuildContext context) async {
    if (isButtonEnabled) {
      if (selectedFeed == null) {
        await addFeeding();
      } else {
        await upDate(selectedFeed!.id); // Güncellendi
      }

      Navigation.push(
        page: HomeView(),
      );

      clearControllersFeeding();
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
  Future<void> initGet() async {
    await getFeeding();
  }

  @action
  void updateButtonStatus() {
    isButtonEnabled = isFieldsFilled();
  }

  @action
  bool isFieldsFilled() {
    return timeController.text.isNotEmpty &&
        mlController.text.isNotEmpty &&
        noteController.text.isNotEmpty;
  }

  @action
  Future<void> init() async {
    await getAll();
  }

  @action
  void add(FeedingModel feed) {
    feedList = List.from(feedList)..insert(0, feed);
  }

  @action
  Future<void> addFeeding() async {
    try {
      var feedmodel = FeedingModel(
          id: Uuid().v1(),
          time: timeController.text,
          amount: int.tryParse(mlController.text),
          note: noteController.text);
      await feedingStorage.addFeeding(feedingModel: feedmodel);

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
  FeedingModel getItem(String id) {
    return feedList.firstWhere((feed) => feed.id == id);
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
