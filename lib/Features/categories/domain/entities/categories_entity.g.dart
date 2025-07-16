// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriesEntityAdapter extends TypeAdapter<CategoriesEntity> {
  @override
  final int typeId = 3;

  @override
  CategoriesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoriesEntity(
      categoryId: fields[0] as int,
      categoryName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoriesEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.categoryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
