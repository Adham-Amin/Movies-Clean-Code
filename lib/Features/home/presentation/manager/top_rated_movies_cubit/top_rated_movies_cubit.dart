import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';
import 'package:movies/Features/home/domain/repos/home_repo.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit({required this.homeRepo})
    : super(TopRatedMoviesInitial());

  final HomeRepo homeRepo;

  Future<void> getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    var result = await homeRepo.getTopRatedMovies();
    result.fold(
      (failure) {
        emit(TopRatedMoviesFailure(message: failure.message));
      },
      (movies) {
        emit(TopRatedMoviesSuccess(movies: movies));
      },
    );
  }
}
