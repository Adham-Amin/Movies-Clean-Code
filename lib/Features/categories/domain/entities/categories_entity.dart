import 'package:hive_flutter/hive_flutter.dart';
part 'categories_entity.g.dart';

@HiveType(typeId: 3)
class CategoriesEntity {
  @HiveField(0)
  final int categoryId;

  @HiveField(1)
  final String categoryName;

  CategoriesEntity({required this.categoryId, required this.categoryName});
}
