// information_local_storage.dart
import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/data/models/information_model.dart';

abstract class InformationLocalStorageHive {
  Future<void> addInformation({required InformationModel informationModel});
  Future<InformationModel?> getInformation({required String id});

  Future<InformationModel> upDateInformation(
      {required InformationModel informationModel});
}

class InformationStorage extends InformationLocalStorageHive {
  @override
  Future<void> addInformation(
      {required InformationModel informationModel}) async {
    await informationBox.put(informationModel.id, informationModel);
  }

  @override
  Future<InformationModel?> getInformation({required String id}) async {
    if (informationBox.containsKey(id)) {
      return informationBox.get(id);
    } else {
      return null;
    }
  }

  @override
  Future<InformationModel> upDateInformation(
      {required InformationModel informationModel}) async {
    await informationModel.save();
    return informationModel;
  }
}
