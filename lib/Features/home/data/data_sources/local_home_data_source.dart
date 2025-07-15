import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

abstract class LocalHomeDataSource {
  Future<List<MoviesEntity>> getPopularMovies();
  Future<List<MoviesEntity>> getTopRatedMovies();
  Future<List<MoviesEntity>> getUpcomingMovies();
}

class LocalHomeDataSourceImpl implements LocalHomeDataSource {
  @override
  Future<List<MoviesEntity>> getPopularMovies() async {
    var box = Hive.box('movies');
    var data = box.get('popular');
    if(data != null && data is List<MoviesEntity>){
      return data;
    }
    return [];
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies() async {
    var box = Hive.box('movies');
    var data = box.get('top_rated');
    if(data != null && data is List<MoviesEntity>){
      return data;
    }
    return [];
  }

  @override
  Future<List<MoviesEntity>> getUpcomingMovies() async {
    var box = Hive.box('movies');
    var data = box.get('upcoming');
    if(data != null && data is List<MoviesEntity>){
      return data;
    }
    return [];
  }
}
