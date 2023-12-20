

import 'package:hive_flutter/adapters.dart';

part 'information_model.g.dart';

@HiveType(typeId: 0)
class InformationModel extends Object {
  @HiveField(0)
  String id;

  @HiveField(1)
  String img;

  @HiveField(2)
  bool cinsiyet;

  @HiveField(3)
  String fullName;

  @HiveField(4)
  String birthDate;

  @HiveField(5)
  String timeOfBirth;

  @HiveField(6)
  String dueDate;

  InformationModel({
    required this.id,
    required this.img,
    required this.cinsiyet,
    required this.fullName,
    required this.birthDate,
    required this.timeOfBirth,
    required this.dueDate,
  });

  @override
  String toString() {
    return 'InformationModel(id: $id, img: $img, cinsiyet: $cinsiyet, fullName: $fullName, birthDate: $birthDate, timeOfBirth: $timeOfBirth, dueDate: $dueDate)';
  }
}
