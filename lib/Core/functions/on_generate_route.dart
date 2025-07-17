import 'package:flutter/material.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';
import 'package:movies/Features/categories/presentation/views/movies_category_view.dart';
import 'package:movies/Features/details/presentation/views/details_movie_view.dart';
import 'package:movies/Features/main_view.dart';
import 'package:movies/Features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case MoviesCategoryView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => MoviesCategoryView(
              category: settings.arguments as CategoriesEntity,
            ),
      );
    case DetailsMovieView.routeName:
      return MaterialPageRoute(
        builder:
            (context) => DetailsMovieView(
              movieId: settings.arguments as int,
            ),
      );
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
