import 'package:dartz/dartz.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Exception, List<CategoriesEntity>>> getCategories();
}