// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesEntityAdapter extends TypeAdapter<MoviesEntity> {
  @override
  final int typeId = 0;

  @override
  MoviesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesEntity(
      idMovie: fields[0] as int,
      name: fields[1] as String,
      posterUrl: fields[2] as String,
      publishedDate: fields[3] as String,
      rating: fields[4] as double,
      bkgroundUrl: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.idMovie)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.posterUrl)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
