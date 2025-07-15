part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}
final class PopularMoviesLoading extends PopularMoviesState {}
final class PopularMoviesSuccess extends PopularMoviesState {
  final List<MoviesEntity> movies;
  PopularMoviesSuccess({required this.movies});
}
final class PopularMoviesFailure extends PopularMoviesState {
  final String message;
  PopularMoviesFailure({required this.message});
}
