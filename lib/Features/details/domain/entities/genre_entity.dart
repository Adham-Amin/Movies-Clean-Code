import 'package:hive_flutter/hive_flutter.dart';
part 'genre_entity.g.dart';

@HiveType(typeId: 2)
class GenreEntity {
  @HiveField(0)
  final int genreId;
  @HiveField(1)
  final String genreName;

  GenreEntity({required this.genreId, required this.genreName});
}