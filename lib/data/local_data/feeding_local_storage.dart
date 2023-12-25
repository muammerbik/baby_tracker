import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/models/feeding_model.dart';


abstract class FeedingLocalStorageHive {
  Future<void> addFeeding({required FeedingModel feedingModel});
  Future<FeedingModel?> getFeeding({required String id});
  Future<List<FeedingModel>> getAllFeeding();
  Future<bool> deleteFeeding({required FeedingModel feedModel});
  Future<FeedingModel> upDateFeeding({required FeedingModel feedModel});
}

class FeedingStorage extends FeedingLocalStorageHive {

  @override
  Future<void> addFeeding({required FeedingModel feedingModel}) async {
    await feedingBox.put(feedingModel.id, feedingModel);
  }

  @override
  Future<bool> deleteFeeding({required FeedingModel feedModel}) async {
    await feedModel.delete();
    return true;
  }

  @override
  Future<List<FeedingModel>> getAllFeeding() async {
    List<FeedingModel> feedingList = <FeedingModel>[];
    feedingList = feedingBox.values.toList();

    if (feedingList.isNotEmpty) {
      feedingList
          .sort((FeedingModel a, FeedingModel b) => b.time.compareTo(a.time));
    }

    return feedingList;
  }

  @override
  Future<FeedingModel?> getFeeding({required String id}) async {
     if (feedingBox.containsKey(id)) {
      return feedingBox.get(id);
    } else {
      return null;
    }
  }

  @override
  Future<FeedingModel> upDateFeeding({required FeedingModel feedModel}) async {
    await feedModel.save();
    return feedModel;
  }
}
