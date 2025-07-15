import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Features/details/domain/repos/details_repo.dart';

part 'details_movie_state.dart';

class DetailsMovieCubit extends Cubit<DetailsMovieState> {
  DetailsMovieCubit({required this.detailsRepo}) : super(DetailsMovieInitial());

  final DetailsRepo detailsRepo;

  Future<void> getDetailsMovie({required int movieId}) async {
    emit(DetailsMovieLoading());
    var result = await detailsRepo.getMovieDetails(movieId: movieId);
    result.fold(
      (failure) => emit(DetailsMovieFailure(message: failure.message)),
      (movie) => emit(DetailsMovieSuccess(movie: movie)),
    );
  }
}
