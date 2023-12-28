// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedItemAdapter extends TypeAdapter<FeedItem> {
  @override
  final int typeId = 4;

  @override
  FeedItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedItem(
      id: fields[0] as String,
      type: fields[1] as String,
      date: fields[2] as String,
      iconPath: fields[3] as String,
      category: fields[4] as String,
      time: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FeedItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.iconPath)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
