import 'package:baby_tracker/data/models/feed_item_model.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:baby_tracker/pages/sleep/viewmodel/sleep_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'calender_viewmodel.g.dart';

class CalenderViewMoel = _CalenderViewMoelBase with _$CalenderViewMoel;

abstract class _CalenderViewMoelBase with Store {
  _CalenderViewMoelBase() {
    initGetAll();
  }

  final feedingGetIt = locator<FeedingViewModel>();
  final diaperGetIt = locator<DiaperViewModel>();
  final sleepGetIt = locator<SleepViewModel>();

  @action
  Future<void> initGetAll() async {
    /*   await feedingGetIt.getAll();
    await diaperGetIt.getAll();
    await sleepGetIt.getAll(); */
  }

//günlük olarak traih değerini veren fonksiyon
  @action
  String getFormattedDate(DateTime date) {
    final dayFormat = DateFormat('E'); // Gün adını al
    final dateFormat = DateFormat('d MMMM y'); // Tarihi al

    final day = dayFormat.format(date);
    final formattedDate = dateFormat.format(date);

    return '$day, $formattedDate';
  }

// all alanında notları yazarken type'ın ilk değerini büyütüp yanına Note ekledim (Feeding Note)
  @action
  String capitalizeWithSuffix(String text, String suffix) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1) + suffix;
  }

  @observable
  List<FeedItem> mergedList = [];

  @observable
  int? allSelectedIndex;

  @action
  void updateSelectedIndex(int index) {
    if (allSelectedIndex == index) {
      allSelectedIndex = null;
    } else {
      allSelectedIndex = index;
    }
  }

  @action
  void mergeLists() {
    mergedList.clear();
    mergedList.insertAll(
        0,
        feedingGetIt.feedList.map((feeding) => FeedItem(
              id: feeding.id,
              type: "feeding",
              date: feeding.time,
              iconPath: "assets/images/bottle.png",
              category: "Feeding",
              time: feeding.time,
              note: feeding.note,
            )));
    mergedList.insertAll(
        0,
        diaperGetIt.diaperList.map((diaper) => FeedItem(
              id: diaper.id,
              type: "diaper",
              date: diaper.time,
              iconPath: "assets/images/diaper1.png",
              category: "Diaper Change",
              time: diaper.time,
              note: diaper.note,
            )));
    mergedList.insertAll(
        0,
        sleepGetIt.sleepList.map((sleep) => FeedItem(
              id: sleep.id,
              type: "sleep",
              date: sleep.wakeUp,
              iconPath: "assets/images/sleep.png",
              category: "Sleep",
              time: sleep.wakeUp,
              note: sleep.note,
            )));

    mergedList.sort((a, b) => b.date.compareTo(a.date));
  }
}
/* 
class CalenderModel {
  String id;
  DateTime history;
  String catagori;
  String created;
  CalenderModel({
    required this.id,
    required this.history,
    required this.catagori,
    required this.created,
  });
} */
