import 'package:movies/Features/categories/domain/entities/categories_entity.dart';

class CategoriesModel extends CategoriesEntity {
  final int id;
  final String name;

  CategoriesModel({required this.id, required this.name})
    : super(categoryId: id, categoryName: name);

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(id: json['id'], name: json['name']);
  }
}
