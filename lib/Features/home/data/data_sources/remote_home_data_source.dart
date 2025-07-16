import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Core/services/api_service.dart';
import 'package:movies/Features/home/data/models/movies_model.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

abstract class RemoteHomeDataSource {
  Future<List<MoviesEntity>> getPopularMovies();
  Future<List<MoviesEntity>> getTopRatedMovies();
  Future<List<MoviesEntity>> getUpcomingMovies();
}

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource {
  final ApiService api;

  RemoteHomeDataSourceImpl({required this.api});

  @override
  Future<List<MoviesEntity>> getPopularMovies() async {
    final data = await api.get(
      endPoint: '/movie/popular?language=en-US&page=1',
    );

    final List<MoviesEntity> moviesList =
        (data['results'] as List)
            .map((movie) => MoviesModel.fromJson(movie))
            .toList();

    final box = Hive.box<MoviesEntity>('popularMovies');
    await box.clear(); // تفريغ البيانات القديمة
    for (var movie in moviesList) {
      box.put(movie.idMovie, movie); // تخزين كل فيلم بـ ID فريد
    }

    return moviesList;
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies() async {
    final data = await api.get(
      endPoint: '/movie/top_rated?language=en-US&page=1',
    );

    final List<MoviesEntity> moviesList =
        (data['results'] as List)
            .map((movie) => MoviesModel.fromJson(movie))
            .toList();

    final box = Hive.box<MoviesEntity>('topRatedMovies');
    await box.clear();
    for (var movie in moviesList) {
      box.put(movie.idMovie, movie);
    }

    return moviesList;
  }

  @override
  Future<List<MoviesEntity>> getUpcomingMovies() async {
    final data = await api.get(
      endPoint: '/movie/upcoming?language=ar-eg&page=2',
    );

    final List<MoviesEntity> moviesList =
        (data['results'] as List)
            .map((movie) => MoviesModel.fromJson(movie))
            .toList();

    final box = Hive.box<MoviesEntity>('upcomingMovies');
    await box.clear();
    for (var movie in moviesList) {
      box.put(movie.idMovie, movie);
    }

    return moviesList;
  }
}
