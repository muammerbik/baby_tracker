
import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/models/sleeep_model.dart';

abstract class SleepLocalStorageHive {
  Future<void> addSleep({required SleepModel sleepModel});
  Future<SleepModel?> getSleep({required String id});
  Future<List<SleepModel>> getAllSSleep();
  Future<bool> deleteSleep({ required SleepModel sleepModel});
  Future<SleepModel> upDateSleep ({required SleepModel sleepModel});


}
class SleepStorage extends SleepLocalStorageHive {

  
  @override
  Future<void> addSleep({required SleepModel sleepModel}) async {
    await sleepBox.put(sleepModel.id, sleepModel);
  }

  @override
  Future<bool> deleteSleep({required SleepModel sleepModel}) async {
   await sleepModel.delete();
    return true;
  }

  @override
  Future<List<SleepModel>> getAllSSleep()  async{
    List<SleepModel> sleepList = <SleepModel>[];
    sleepList = sleepBox.values.toList();

    if (sleepList.isNotEmpty) {
      sleepList
          .sort((SleepModel a, SleepModel b) => b.wakeUp.compareTo(a.wakeUp));
    }

    return sleepList;
  }

  @override
  Future<SleepModel?> getSleep({required String id}) async{
    if (sleepBox.containsKey(id)) {
      return sleepBox.get(id);
    } else {
      return null;
    }

  }

  @override
  Future<SleepModel> upDateSleep({required SleepModel sleepModel}) async {
    await sleepModel.save();
    return sleepModel;
  }
}