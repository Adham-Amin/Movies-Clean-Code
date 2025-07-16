import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';

abstract class LocalHomeDataSource {
  Future<List<MoviesEntity>> getPopularMovies();
  Future<List<MoviesEntity>> getTopRatedMovies();
  Future<List<MoviesEntity>> getUpcomingMovies();
}

class LocalHomeDataSourceImpl implements LocalHomeDataSource {
  @override
  Future<List<MoviesEntity>> getPopularMovies() async {
    var box = Hive.box<MoviesEntity>('popularMovies');
    return box.values.toList();
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies() async {
    var box = Hive.box<MoviesEntity>('topRatedMovies');
    return box.values.toList();
  }

  @override
  Future<List<MoviesEntity>> getUpcomingMovies() async {
    var box = Hive.box<MoviesEntity>('upcomingMovies');
    return box.values.toList();
  }
}
