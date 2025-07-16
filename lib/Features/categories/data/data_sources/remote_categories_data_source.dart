import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Core/services/api_service.dart';
import 'package:movies/Features/categories/data/models/categories_model.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';

abstract class RemoteCategoriesDataSource {
  Future<List<CategoriesEntity>> getCategories();
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
}
