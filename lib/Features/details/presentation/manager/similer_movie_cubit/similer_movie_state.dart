part of 'similer_movie_cubit.dart';

abstract class SimilerMovieState {}

final class SimilerMovieInitial extends SimilerMovieState {}
final class SimilerMovieLoading extends SimilerMovieState {}
final class SimilerMovieSuccess extends SimilerMovieState {
  final List<MoviesEntity> similerMovies;
  SimilerMovieSuccess({required this.similerMovies});
}
final class SimilerMovieFailure extends SimilerMovieState {
  final String message;
  SimilerMovieFailure({required this.message});
}
