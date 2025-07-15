import 'package:dartz/dartz.dart';
import 'package:movies/Core/error/failure.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

abstract class DetailsRepo {
  Future<Either<Failure, DetailsMovieEntity>> getMovieDetails({required int movieId});
  Future<Either<Failure, List<MoviesEntity>>> getMovieSimiler({required int movieId});
}