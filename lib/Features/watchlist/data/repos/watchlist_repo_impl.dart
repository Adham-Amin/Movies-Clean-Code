import 'package:movies/Core/domain/entities/movies_entity.dart';
import 'package:movies/Features/watchlist/data/data_sources/local_watchlist_data_source.dart';
import 'package:movies/Features/watchlist/domain/repos/watchlist_repo.dart';

class WatchlistRepoImpl extends WatchlistRepo {
  final LocalWatchlistDataSource localWatchlistDataSource;

  WatchlistRepoImpl({required this.localWatchlistDataSource});
  @override
  @override
  Future<void> addToWatchlist({required MoviesEntity movie}) async {
    final isInWatchlist = await localWatchlistDataSource.isMovieInWatchlist(
      movieId: movie.idMovie,
    );
    if (isInWatchlist) return;
    await localWatchlistDataSource.addToWatchlist(movie: movie);
  }

  @override
  Future<List<MoviesEntity>> getWatchlist() async {
    var movies = await localWatchlistDataSource.getWatchlist();
    return movies;
  }

  @override
  Future<bool> isMovieInWatchlist({required int movieId}) async {
    return await localWatchlistDataSource.isMovieInWatchlist(movieId: movieId);
  }

  @override
  Future<void> removeFromWatchlist({required MoviesEntity movie}) async {
    await localWatchlistDataSource.removeFromWatchlist(movie: movie);
  }
}
