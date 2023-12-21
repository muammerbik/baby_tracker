// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'sleeep_model.g.dart';
@HiveType(typeId: 3)
class SleepModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String fellSleep;

  @HiveField(2)
  String wakeUp;
  
  @HiveField(3)
  String note;

  SleepModel({
    required this.id,
    required this.fellSleep,
    required this.wakeUp,
    required this.note,
  });

  @override
  String toString() {
    return 'SleepModel(id: $id, fellSleep: $fellSleep, wakeUp: $wakeUp, note: $note)';
  }
}
