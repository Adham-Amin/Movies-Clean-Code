import 'package:movies/Core/domain/entities/movies_entity.dart';

abstract class WatchlistRepo {
  Future<void> addToWatchlist({required MoviesEntity movie});
  Future<void> removeFromWatchlist({required MoviesEntity movie});
  Future<bool> isMovieInWatchlist({required int movieId});
  Future<List<MoviesEntity>> getWatchlist();
}