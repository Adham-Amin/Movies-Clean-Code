part of 'details_movie_cubit.dart';

abstract class DetailsMovieState {}

final class DetailsMovieInitial extends DetailsMovieState {}
final class DetailsMovieLoading extends DetailsMovieState {}
final class DetailsMovieSuccess extends DetailsMovieState {
  final DetailsMovieEntity movie;
  DetailsMovieSuccess({required this.movie});
}
final class DetailsMovieFailure extends DetailsMovieState {
  final String message;
  DetailsMovieFailure({required this.message});
}
