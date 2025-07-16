import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/services/getit_service.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';
import 'package:movies/Features/categories/domain/repos/categories_repo.dart';
import 'package:movies/Features/categories/presentation/manager/movies_category_cubit/movies_category_cubit.dart';
import 'package:movies/Features/categories/presentation/widgets/movies_category_view_body.dart';

class MoviesCategoryView extends StatelessWidget {
  const MoviesCategoryView({super.key, required this.category});

  static const routeName = '/movies_category_view';
  final CategoriesEntity category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.categoryName, style: AppStyles.textSemiBold18),
          centerTitle: true,
        ),
        body: BlocProvider(
          create:
              (context) => MoviesCategoryCubit(
                categoriesRepo: getIt.get<CategoriesRepo>(),
              ),
          child: MoviesCategoryViewBody(id: category.categoryId),
        ),
      ),
    );
  }
}
