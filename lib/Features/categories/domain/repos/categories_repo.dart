import 'package:dartz/dartz.dart';
import 'package:movies/Core/error/failure.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, List<MoviesEntity>>> getMoviesByCategory({required int categoryId});
}