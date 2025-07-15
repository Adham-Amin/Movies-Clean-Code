import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';
import 'package:movies/Features/home/domain/repos/home_repo.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  UpcomingMoviesCubit({required this.homeRepo}) : super(UpcomingMoviesInitial());

  final HomeRepo homeRepo;

  Future<void> getUpcomingMovies() async {
    emit(UpcomingMoviesLoading());
    var result = await homeRepo.getUpcomingMovies();
    result.fold(
      (failure) {
        emit(UpcomingMoviesFailure(message: failure.message));
      },
      (movies) {
        emit(UpcomingMoviesSuccess(movies: movies));
      },
    );
  }
}
