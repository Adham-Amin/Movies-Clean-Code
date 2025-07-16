import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';

abstract class LocalCategoriesDataSource {
  Future<List<CategoriesEntity>> getCategories();
}

class LocalCategoriesDataSourceImpl implements LocalCategoriesDataSource {
  @override
  Future<List<CategoriesEntity>> getCategories() async {
    var box = Hive.box<CategoriesEntity>('categories');
    return box.values.toList();
  }
}
