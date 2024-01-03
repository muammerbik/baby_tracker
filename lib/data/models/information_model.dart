// ignore_for_file: public_member_api_docs, sort_constructors_first
// information_model.dart
import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'information_model.g.dart';

@HiveType(typeId: 0)
class InformationModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String? img; // Resmi temsil eden byte dizisi

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
