import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:baby_tracker/pages/sleep/viewmodel/sleep_viewmodel.dart';
import 'package:mobx/mobx.dart';
part 'calender_viewmodel.g.dart';

class CalenderViewMoel = _CalenderViewMoelBase with _$CalenderViewMoel;

abstract class _CalenderViewMoelBase with Store {

  final feedingGetIt = locator<FeedingViewModel>();
  final diaperGetIt = locator.get<DiaperViewModel>();
  final sleepGetIt = locator<SleepViewModel>();
  
  @observable
  List<FeedItem> mergedList = [];

  @action
  void mergeLists() {
    mergedList.clear();
    mergedList.addAll(feedingGetIt.feedList.map((feeding) => FeedItem(
          id: feeding.id,
          type: "feeding",
          date: feeding.time,
          iconPath: "assets/images/bottle.png",
          category: "Feeding",
          time: feeding.time,
        )));
    mergedList.addAll(diaperGetIt.diaperList.map((diaper) => FeedItem(
          id: diaper.id,
          type: "diaper",
          date: diaper.time,
          iconPath: "assets/images/diaper1.png",
          category: "Diaper Change",
          time: diaper.time,
        )));
    mergedList.addAll(sleepGetIt.sleepList.map((sleep) => FeedItem(
          id: sleep.id,
          type: "sleep",
          date: sleep.wakeUp,
          iconPath: "assets/images/sleep.png",
          category: "Sleep",
          time: sleep.wakeUp,
        )));

    mergedList.sort((a, b) => b.date.compareTo(a.date));
  }
}

class FeedItem {
  final String id;
  final String type;
  final String date;
  final String iconPath;
  final String category;
  final String time;

  FeedItem({
    required this.id,
    required this.type,
    required this.date,
    required this.iconPath,
    required this.category,
    required this.time,
  });
}