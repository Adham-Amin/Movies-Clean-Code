import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';
import 'package:movies/Features/categories/domain/repos/categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.categoriesRepo}) : super(CategoriesInitial());

  final CategoriesRepo categoriesRepo;

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var result = await categoriesRepo.getCategories();
    result.fold(
      (failure) => emit(CategoriesFailure(message: failure.message)),
      (categories) => emit(CategoriesSuccess(categoriesList: categories)),
    );
  }
}
