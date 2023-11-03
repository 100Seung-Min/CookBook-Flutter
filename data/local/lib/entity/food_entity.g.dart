// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodHiveEntityAdapter extends TypeAdapter<FoodHiveEntity> {
  @override
  final int typeId = 0;

  @override
  FoodHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodHiveEntity()
      ..recipeId = fields[0] as int
      ..recipeName = fields[1] as String
      ..summary = fields[2] as String
      ..cookingTime = fields[3] as String
      ..calorie = fields[4] as String
      ..level = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, FoodHiveEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.recipeId)
      ..writeByte(1)
      ..write(obj.recipeName)
      ..writeByte(2)
      ..write(obj.summary)
      ..writeByte(3)
      ..write(obj.cookingTime)
      ..writeByte(4)
      ..write(obj.calorie)
      ..writeByte(5)
      ..write(obj.level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
