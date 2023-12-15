// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InformationModelAdapter extends TypeAdapter<InformationModel> {
  @override
  final int typeId = 0;

  @override
  InformationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InformationModel(
      id: fields[0] as String,
      img: fields[1] as String,
      cinsiyet: fields[2] as bool,
      fullName: fields[3] as String,
      birthDate: fields[4] as String,
      timeOfBirth: fields[5] as String,
      dueDate: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InformationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.img)
      ..writeByte(2)
      ..write(obj.cinsiyet)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.birthDate)
      ..writeByte(5)
      ..write(obj.timeOfBirth)
      ..writeByte(6)
      ..write(obj.dueDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InformationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
