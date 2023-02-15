// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FriendDataAdapter extends TypeAdapter<FriendData> {
  @override
  final int typeId = 1;

  @override
  FriendData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FriendData(
      id: fields[0] as int,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      mobileNumber: fields[3] as String,
      dob: fields[4] as String,
      birthLocation: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FriendData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.mobileNumber)
      ..writeByte(4)
      ..write(obj.dob)
      ..writeByte(5)
      ..write(obj.birthLocation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
