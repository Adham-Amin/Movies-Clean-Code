class MoviesEntity {
  final int idMovie;
  final String name;
  final String posterUrl;
  final String publishedDate;
  final double rating;

  MoviesEntity({
    required this.idMovie,
    required this.name,
    required this.posterUrl,
    required this.publishedDate,
    required this.rating,
  });
}
