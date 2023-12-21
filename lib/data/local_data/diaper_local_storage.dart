
import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/models/diaper_change_model.dart';

abstract class DiaperLocalStorageHive {
  Future<void> addDiaper({required DiaperChangeModel diaperChangeModel});
  Future<DiaperChangeModel?> getDiaper({required String id});
  Future<List<DiaperChangeModel>> getAllDiaper();
  Future<bool> deleteDiaper({ required DiaperChangeModel diaperChangeModel});
  Future<DiaperChangeModel> upDateDiaper ({required DiaperChangeModel diaperChangeModel});
}

class DiaperStorage extends DiaperLocalStorageHive{



  @override
  Future<void> addDiaper({required DiaperChangeModel diaperChangeModel}) async {
      await diaperBox.put(diaperChangeModel.id, diaperChangeModel);
  }

  @override
  Future<bool> deleteDiaper({required DiaperChangeModel diaperChangeModel}) async {
    await diaperChangeModel.delete();
    return true;
  }

  @override
  Future<List<DiaperChangeModel>> getAllDiaper()  async{
      List<DiaperChangeModel> diaperList = <DiaperChangeModel>[];
    diaperList = diaperBox.values.toList();

    if (diaperList.isNotEmpty) {
      diaperList
          .sort((DiaperChangeModel a, DiaperChangeModel b) => b.time.compareTo(a.time));
    }

    return diaperList;
  }

  @override
  Future<DiaperChangeModel?> getDiaper({required String id}) async{
   if (diaperBox.containsKey(id)) {
      return diaperBox.get(id);
    } else {
      return null;
    }
  }

  @override
  Future<DiaperChangeModel> upDateDiaper({required DiaperChangeModel diaperChangeModel}) async {
  await diaperChangeModel.save();
    return diaperChangeModel;
  }
}