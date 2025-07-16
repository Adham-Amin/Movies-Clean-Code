import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/categories/domain/repos/categories_repo.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';

part 'movies_category_state.dart';

class MoviesCategoryCubit extends Cubit<MoviesCategoryState> {
  MoviesCategoryCubit({required this.categoriesRepo})
    : super(MoviesCategoryInitial());

  final CategoriesRepo categoriesRepo;

  Future<void> getMoviesByCategory({required int id}) async {
    emit(MoviesCategoryLoading());
    var result = await categoriesRepo.getMoviesByCategory(categoryId: id);
    result.fold(
      (failure) => emit(MoviesCategoryFailure(message: failure.message)),
      (movies) => emit(MoviesCategorySuccess(moviesCategory: movies)),
    );
  }
}
