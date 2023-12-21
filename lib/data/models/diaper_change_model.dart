// ignore_for_file: public_member_api_docs, sort_constructors_first
 
import 'package:hive/hive.dart';
part 'diaper_change_model.g.dart';
@HiveType(typeId: 2)
class DiaperChangeModel extends HiveObject {
@HiveField(0)
  String id;

  @HiveField(1)
  String time;

  @HiveField(2)
  String diaperStatus;

  @HiveField(3)
  String note;
  
  DiaperChangeModel({
    required this.id,
    required this.time,
    required this.diaperStatus,
    required this.note,
  });

  @override
  String toString() {
    return 'DiaperChangeModel(id: $id, time: $time, diaperStatus: $diaperStatus, note: $note)';
  }
}
