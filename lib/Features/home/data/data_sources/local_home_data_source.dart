import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Features/home/data/models/movies_model.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

abstract class LocalHomeDataSource {
  Future<List<MoviesEntity>> getPopularMovies();
  Future<List<MoviesEntity>> getTopRatedMovies();
  Future<List<MoviesEntity>> getUpcomingMovies();
}

class LocalHomeDataSourceImpl implements LocalHomeDataSource {
  @override
  Future<List<MoviesEntity>> getPopularMovies() async {
    var box = Hive.box('popularMovies');
    return box.values.whereType<MoviesModel>().cast<MoviesEntity>().toList();
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies() async {
    var box = Hive.box('topRatedMovies');
    return box.values.whereType<MoviesModel>().cast<MoviesEntity>().toList();
  }

  @override
  Future<List<MoviesEntity>> getUpcomingMovies() async {
    var box = Hive.box('upcomingMovies');
    return box.values.whereType<MoviesModel>().cast<MoviesEntity>().toList();
  }
}
