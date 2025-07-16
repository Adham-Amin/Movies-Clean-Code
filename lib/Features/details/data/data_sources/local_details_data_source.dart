import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';

abstract class LocalDetailsDataSource {
  Future<DetailsMovieEntity?> getMovieDetails({required int movieId});
  Future<List<MoviesEntity>> getMovieSimiler({required int movieId});
}

class LocalDetailsDataSourceImpl implements LocalDetailsDataSource {
  @override
  Future<DetailsMovieEntity?> getMovieDetails({required int movieId}) async {
    final box = Hive.box<DetailsMovieEntity>('moviesDetails');
    return box.get(movieId);
  }

  @override
  Future<List<MoviesEntity>> getMovieSimiler({required int movieId}) async {
    final box = Hive.box<MoviesEntity>('similerMovies');
    return box.values.toList();
  }
}
