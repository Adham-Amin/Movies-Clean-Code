import 'package:dartz/dartz.dart';
import 'package:movies/Core/error/failure.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
}