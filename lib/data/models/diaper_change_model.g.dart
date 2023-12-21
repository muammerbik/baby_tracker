// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diaper_change_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaperChangeModelAdapter extends TypeAdapter<DiaperChangeModel> {
  @override
  final int typeId = 2;

  @override
  DiaperChangeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiaperChangeModel(
      id: fields[0] as String,
      time: fields[1] as String,
      diaperStatus: fields[2] as String,
      note: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DiaperChangeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.diaperStatus)
      ..writeByte(3)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiaperChangeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
