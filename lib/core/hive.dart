import 'package:baby_tracker/data/models/diaper_change_model.dart';
import 'package:baby_tracker/data/models/feed_item_model.dart';
import 'package:baby_tracker/data/models/feeding_model.dart';
import 'package:baby_tracker/data/models/sleeep_model.dart';
import 'package:baby_tracker/data/models/information_model.dart';
import 'package:hive/hive.dart';

late Box<InformationModel> informationBox;
late Box<FeedingModel> feedingBox;
late Box<DiaperChangeModel> diaperBox;
late Box<SleepModel> sleepBox;
late Box<FeedItem> allListBox;

Future<void> allBox() async {
  informationBox = await Hive.openBox<InformationModel>('informationBox');
  feedingBox = await Hive.openBox<FeedingModel>("feedingBox");
  diaperBox = await Hive.openBox<DiaperChangeModel>("diaperBox");
  sleepBox = await Hive.openBox<SleepModel>("sleepBox");
  allListBox = await Hive.openBox<FeedItem>("allListBox");
}

Future<void> allAdapter() async {
  Hive.registerAdapter(InformationModelAdapter());
  Hive.registerAdapter(FeedingModelAdapter());
  Hive.registerAdapter(DiaperChangeModelAdapter());
  Hive.registerAdapter(SleepModelAdapter());
  Hive.registerAdapter(FeedItemAdapter());
}
