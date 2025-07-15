import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

abstract class LocalDetailsDataSource {
  Future<DetailsMovieEntity?> getMovieDetails({required int movieId});
  Future<List<MoviesEntity>> getMovieSimiler({required int movieId});
}

class LocalDetailsDataSourceImpl implements LocalDetailsDataSource {
  @override
  Future<DetailsMovieEntity?> getMovieDetails({required int movieId}) async {
    final box = Hive.box('moviesDetails');
    final data = box.get(movieId);
    if (data is DetailsMovieEntity) {
      return data;
    }
    return null;
  }

  @override
  Future<List<MoviesEntity>> getMovieSimiler({required int movieId}) async {
    final box = Hive.box('moviesDetails');
    final data = box.get(movieId);
    if (data is List<MoviesEntity>) {
      return data;
    }
    return [];
  }
}
