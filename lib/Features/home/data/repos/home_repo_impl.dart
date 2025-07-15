import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/Core/error/failure.dart';
import 'package:movies/Features/home/data/data_sources/local_home_data_source.dart';
import 'package:movies/Features/home/data/data_sources/remote_home_data_source.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';
import 'package:movies/Features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final RemoteHomeDataSource remoteHomeDataSource;
  final LocalHomeDataSource localHomeDataSource;

  HomeRepoImpl({
    required this.remoteHomeDataSource,
    required this.localHomeDataSource,
  });

  @override
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies() async {
    try {
      var data = await localHomeDataSource.getPopularMovies();

      if (data.isNotEmpty) {
        return right(data);
      }
      data = await remoteHomeDataSource.getPopularMovies();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies() async {
    try {
      var data = await localHomeDataSource.getTopRatedMovies();

      if (data.isNotEmpty) {
        return right(data);
      }

      data = await remoteHomeDataSource.getTopRatedMovies();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getUpcomingMovies() async {
    try {
      var data = await localHomeDataSource.getUpcomingMovies();

      if (data.isNotEmpty) {
        return right(data);
      }

      data = await remoteHomeDataSource.getUpcomingMovies();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
