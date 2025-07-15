import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/details/domain/repos/details_repo.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

part 'similer_movie_state.dart';

class SimilerMovieCubit extends Cubit<SimilerMovieState> {
  SimilerMovieCubit({required this.detailsRepo}) : super(SimilerMovieInitial());

  final DetailsRepo detailsRepo;

  Future<void> getSimilerMovie({required int movieId}) async {
    emit(SimilerMovieLoading());
    var result = await detailsRepo.getMovieSimiler(movieId: movieId);
    result.fold(
      (failure) => emit(SimilerMovieFailure(message: failure.message)),
      (movies) => emit(SimilerMovieSuccess(similerMovies: movies)),
    );
  }
}
