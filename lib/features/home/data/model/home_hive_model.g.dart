// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeHiveModelAdapter extends TypeAdapter<HomeHiveModel> {
  @override
  final int typeId = 1;

  @override
  HomeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeHiveModel(
      userId: fields[0] as String?,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      phone: fields[3] as String,
      email: fields[4] as String,
      address: fields[5] as String,
      specialization: fields[6] as String,
      experience: fields[7] as String,
      feesPerCunsaltation: fields[8] as int?,
      status: fields[9] as String,
      timings: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.specialization)
      ..writeByte(7)
      ..write(obj.experience)
      ..writeByte(8)
      ..write(obj.feesPerCunsaltation)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.timings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
