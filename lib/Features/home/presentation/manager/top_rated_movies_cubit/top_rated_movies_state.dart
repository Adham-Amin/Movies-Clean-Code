part of 'top_rated_movies_cubit.dart';

abstract class TopRatedMoviesState {}

final class TopRatedMoviesInitial extends TopRatedMoviesState {}

final class TopRatedMoviesLoading extends TopRatedMoviesState {}

final class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final List<MoviesEntity> movies;
  TopRatedMoviesSuccess({required this.movies});
}

final class TopRatedMoviesFailure extends TopRatedMoviesState {
  final String message;
  TopRatedMoviesFailure({required this.message});
}
