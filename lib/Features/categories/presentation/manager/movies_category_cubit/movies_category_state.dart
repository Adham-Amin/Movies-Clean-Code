part of 'movies_category_cubit.dart';

abstract class MoviesCategoryState {}

final class MoviesCategoryInitial extends MoviesCategoryState {}

final class MoviesCategoryLoading extends MoviesCategoryState {}

final class MoviesCategorySuccess extends MoviesCategoryState {
  final List<MoviesEntity> moviesCategory;
  MoviesCategorySuccess({required this.moviesCategory});
}

final class MoviesCategoryFailure extends MoviesCategoryState {
  final String message;
  MoviesCategoryFailure({required this.message});
}
