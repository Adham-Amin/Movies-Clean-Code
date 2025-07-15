import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Features/details/domain/entities/genre_entity.dart';
part 'details_movie_entity.g.dart';

@HiveType(typeId: 1)
class DetailsMovieEntity {
  @HiveField(0)
  final int idMovie;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String backgroundImage;
  @HiveField(3)
  final String posterImage;
  @HiveField(4)
  final List<GenreEntity> genresList;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String publishedDate;
  @HiveField(7)
  final num rating;

  DetailsMovieEntity({
    required this.idMovie,
    required this.name,
    required this.publishedDate,
    required this.backgroundImage,
    required this.posterImage,
    required this.genresList,
    required this.description,
    required this.rating,
  });
}
