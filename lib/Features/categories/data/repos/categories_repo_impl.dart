import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/Core/error/failure.dart';
import 'package:movies/Features/categories/data/data_sources/local_categories_data_source.dart';
import 'package:movies/Features/categories/data/data_sources/remote_categories_data_source.dart';
import 'package:movies/Features/categories/domain/entities/categories_entity.dart';
import 'package:movies/Features/categories/domain/repos/categories_repo.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final RemoteCategoriesDataSource remoteCategoriesDataSource;
  final LocalCategoriesDataSource localCategoriesDataSource;

  CategoriesRepoImpl({
    required this.remoteCategoriesDataSource,
    required this.localCategoriesDataSource,
  });
  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() async {
    try {
      var data = await localCategoriesDataSource.getCategories();
      if (data.isEmpty) {
        data = await remoteCategoriesDataSource.getCategories();
      }
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
