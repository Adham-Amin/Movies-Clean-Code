import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/Core/error/failure.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';
import 'package:movies/Features/search/data/data_sources/remote_search_data_source.dart';
import 'package:movies/Features/search/domain/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  SearchRepoImpl({required this.remoteSearchDataSource});
  final RemoteSearchDataSource remoteSearchDataSource;

  @override
  Future<Either<Failure, List<MoviesEntity>>> searchMovies({
    required String movieQuery,
  }) async {
    try {
      var data = await remoteSearchDataSource.searchMovies(
        movieQuery: movieQuery,
      );

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
