import 'package:hive_flutter/hive_flutter.dart';
part 'movies_entity.g.dart';

@HiveType(typeId: 0)
class MoviesEntity {
  @HiveField(0)
  final int idMovie;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String posterUrl;
  @HiveField(3)
  final String publishedDate;
  @HiveField(4)
  final double rating;
  @HiveField(5)
  final String bkgroundUrl;

  MoviesEntity({
    required this.bkgroundUrl,
    required this.idMovie,
    required this.name,
    required this.posterUrl,
    required this.publishedDate,
    required this.rating,
  });
}
