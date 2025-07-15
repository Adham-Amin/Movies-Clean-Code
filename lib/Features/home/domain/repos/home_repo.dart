import 'package:dartz/dartz.dart';
import 'package:movies/Core/error/failure.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies();
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies();
  Future<Either<Failure, List<MoviesEntity>>> getUpcomingMovies();
}