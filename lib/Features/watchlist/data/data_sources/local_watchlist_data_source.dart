import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';

abstract class LocalWatchlistDataSource {
  Future<void> addToWatchlist({required MoviesEntity movie});
  Future<void> removeFromWatchlist({required MoviesEntity movie});
  Future<bool> isMovieInWatchlist({required int movieId});
  Future<List<MoviesEntity>> getWatchlist();
}
class LocalWatchlistDataSourceImpl extends LocalWatchlistDataSource {
  @override
  Future<void> addToWatchlist({required MoviesEntity movie}) async {
    final watchlistBox = Hive.box<MoviesEntity>('watchlist');
    await watchlistBox.put(movie.idMovie, movie);
  }

  @override
  Future<void> removeFromWatchlist({required MoviesEntity movie}) async {
    final watchlistBox = Hive.box<MoviesEntity>('watchlist');
    await watchlistBox.delete(movie.idMovie);
  }

  @override
  Future<bool> isMovieInWatchlist({required int movieId}) async {
    final watchlistBox = Hive.box<MoviesEntity>('watchlist');
    return watchlistBox.containsKey(movieId);
  }

  @override
  Future<List<MoviesEntity>> getWatchlist() async {
    final watchlistBox = Hive.box<MoviesEntity>('watchlist');
    return watchlistBox.values.toList();
  }
}
