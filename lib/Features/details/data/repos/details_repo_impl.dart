import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/Core/error/failure.dart';
import 'package:movies/Features/details/data/data_sources/local_details_data_source.dart';
import 'package:movies/Features/details/data/data_sources/remote_details_data_source.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Features/details/domain/repos/details_repo.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';

class DetailsRepoImpl extends DetailsRepo {
  final RemoteDetailsDataSource remoteDetailsDataSource;
  final LocalDetailsDataSource localDetailsDataSource;

  DetailsRepoImpl({
    required this.remoteDetailsDataSource,
    required this.localDetailsDataSource,
  });

  @override
  Future<Either<Failure, DetailsMovieEntity>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      var data = await localDetailsDataSource.getMovieDetails(movieId: movieId);
      if (data != null) {
        return right(data);
      }
      data = await remoteDetailsDataSource.getMovieDetails(movieId: movieId);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMovieSimiler({
    required int movieId,
  }) async {
    try {
      var data = await localDetailsDataSource.getMovieSimiler(movieId: movieId);
      if (data.isNotEmpty) {
        return right(data);
      }
      data = await remoteDetailsDataSource.getMovieSimiler(movieId: movieId);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
