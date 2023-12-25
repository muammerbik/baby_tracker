// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'feeding_model.g.dart';

@HiveType(typeId: 1)
class FeedingModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String time;

  @HiveField(2)
  int? amount;

  @HiveField(3)
  String note;
  
  FeedingModel({
    required this.id,
    required this.time,
    required this.amount,
    required this.note,
  });

  @override
  String toString() {
    return 'FeedingModel(id: $id, time: $time, amount: $amount, note: $note)';
  }
}
