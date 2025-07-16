import 'package:dartz/dartz.dart';
import 'package:movies/Core/error/failure.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MoviesEntity>>> searchMovies({required String movieQuery});
}