// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailsMovieEntityAdapter extends TypeAdapter<DetailsMovieEntity> {
  @override
  final int typeId = 1;

  @override
  DetailsMovieEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailsMovieEntity(
      idMovie: fields[0] as int,
      name: fields[1] as String,
      publishedDate: fields[6] as String,
      backgroundImage: fields[2] as String,
      posterImage: fields[3] as String,
      genresList: (fields[4] as List).cast<GenreEntity>(),
      description: fields[5] as String,
      rating: fields[7] as num,
    );
  }

  @override
  void write(BinaryWriter writer, DetailsMovieEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.idMovie)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.backgroundImage)
      ..writeByte(3)
      ..write(obj.posterImage)
      ..writeByte(4)
      ..write(obj.genresList)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.publishedDate)
      ..writeByte(7)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsMovieEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
