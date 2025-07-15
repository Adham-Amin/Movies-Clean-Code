part of 'upcoming_movies_cubit.dart';

abstract class UpcomingMoviesState {}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}

final class UpcomingMoviesLoading extends UpcomingMoviesState {}

final class UpcomingMoviesSuccess extends UpcomingMoviesState {
  final List<MoviesEntity> movies;
  UpcomingMoviesSuccess({required this.movies});
}

final class UpcomingMoviesFailure extends UpcomingMoviesState {
  final String message;
  UpcomingMoviesFailure({required this.message});
}
