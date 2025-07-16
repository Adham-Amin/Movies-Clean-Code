import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/services/getit_service.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Features/categories/domain/repos/categories_repo.dart';
import 'package:movies/Features/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:movies/Features/categories/presentation/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Browse Category', style: AppStyles.textSemiBold18),
          centerTitle: true,
        ),
        body: BlocProvider(
          create:
              (context) =>
                  CategoriesCubit(categoriesRepo: getIt.get<CategoriesRepo>())..getCategories(),
          child: CategoriesViewBody(),
        ),
      ),
    );
  }
}
