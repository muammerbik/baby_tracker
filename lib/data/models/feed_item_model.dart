// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

part 'feed_item_model.g.dart';

@HiveType(typeId: 4)
class FeedItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String type;
  
  @HiveField(2)
  final String date;

  @HiveField(3)
  final String iconPath;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final String time;

  FeedItem({
    required this.id,
    required this.type,
    required this.date,
    required this.iconPath,
    required this.category,
    required this.time,
  });

  @override
  String toString() {
    return 'FeedItem(id: $id, type: $type, date: $date, iconPath: $iconPath, category: $category, time: $time)';
  }
}
