// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeding_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedingModelAdapter extends TypeAdapter<FeedingModel> {
  @override
  final int typeId = 1;

  @override
  FeedingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedingModel(
      id: fields[0] as String,
      time: fields[1] as String,
      amount: fields[2] as int,
      note: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FeedingModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
