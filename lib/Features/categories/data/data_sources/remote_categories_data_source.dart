import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Core/services/api_service.dart';
import 'package:movies/Features/categories/data/models/categories_model.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';
import 'package:movies/Features/home/data/models/movies_model.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';

abstract class RemoteCategoriesDataSource {
  Future<List<CategoriesEntity>> getCategories();
  Future<List<MoviesEntity>> getMoviesByCategory({required int categoryId});
}

class RemoteCategoriesDataSourceImpl implements RemoteCategoriesDataSource {
  final ApiService apiService;
  RemoteCategoriesDataSourceImpl({required this.apiService});

  @override
  Future<List<CategoriesEntity>> getCategories() async {
    var data = await apiService.get(endPoint: '/genre/movie/list?language=en');

    List<CategoriesEntity> categoriesList = [];
    for (var category in data['genres']) {
      categoriesList.add(CategoriesModel.fromJson(category));
    }

    var box = Hive.box<CategoriesEntity>('categories');
    await box.addAll(categoriesList);

    return categoriesList;
  }

  @override
  Future<List<MoviesEntity>> getMoviesByCategory({
    required int categoryId,
  }) async {
    var data = await apiService.get(
      endPoint:
          '/discover/movie?language=en-US&page=1&sort_by=popularity.desc&with_genres=$categoryId',
    );

    List<MoviesEntity> categoriesList = [];
    for (var category in data['results']) {
      categoriesList.add(MoviesModel.fromJson(category));
    }

    return categoriesList;
  }
}
