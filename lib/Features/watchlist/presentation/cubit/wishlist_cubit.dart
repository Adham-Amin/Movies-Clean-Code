import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';
import 'package:movies/Features/watchlist/domain/repos/watchlist_repo.dart';
import 'package:movies/Features/watchlist/presentation/cubit/wishlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final WatchlistRepo watchlistRepo;

  WatchlistCubit({required this.watchlistRepo}) : super(WatchlistInitial());

  Future<void> loadWatchlist() async {
    emit(WatchlistLoading());
    try {
      final watchlist = await watchlistRepo.getWatchlist();
      emit(WatchlistLoaded(watchlist));
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  Future<void> toggleWatchlist(MoviesEntity movie) async {
    try {
      final isInWatchlist = await watchlistRepo.isMovieInWatchlist(movieId: movie.idMovie);
      if (isInWatchlist) {
        await watchlistRepo.removeFromWatchlist(movie: movie);
      } else {
        await watchlistRepo.addToWatchlist(movie: movie);
      }
      await loadWatchlist();
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }
}
