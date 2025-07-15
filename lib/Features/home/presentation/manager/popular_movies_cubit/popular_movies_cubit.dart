import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';
import 'package:movies/Features/home/domain/repos/home_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit({required this.homeRepo}) : super(PopularMoviesInitial());

  final HomeRepo homeRepo;

  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoading());
    var result = await homeRepo.getPopularMovies();
    result.fold(
      (failure) {
        emit(PopularMoviesFailure(message: failure.message));
      },
      (movies) {
        emit(PopularMoviesSuccess(movies: movies));
      },
    );
  }
}
