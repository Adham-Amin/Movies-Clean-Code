part of 'categories_cubit.dart';

abstract class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesLoading extends CategoriesState {}
final class CategoriesSuccess extends CategoriesState {
  final List<CategoriesEntity> categoriesList;
  CategoriesSuccess({required this.categoriesList});
}
final class CategoriesFailure extends CategoriesState {
  final String message;
  CategoriesFailure({required this.message});
}
