part of 'search_cubit.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<MoviesEntity> movies;
  SearchSuccess({required this.movies});
}
final class SearchFailure extends SearchState {
  final String message;
  SearchFailure({required this.message});
}
