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
    var data = await api.get(endPoint: '/popular?language=en-US&page=1');

    final List<MoviesEntity> moviesList = [];

    for (var movie in data['results']) {
      moviesList.add(MoviesModel.fromJson(movie));
    }

    return moviesList;
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies() async {
    var data = await api.get(endPoint: '/top_rated?language=en-US&page=1');

    final List<MoviesEntity> moviesList = [];
    for (var movie in data['results']) {
      moviesList.add(MoviesModel.fromJson(movie));
    }

    return moviesList;
  }

  @override
  Future<List<MoviesEntity>> getUpcomingMovies() async {
    var data = await api.get(endPoint: '/upcoming?language=ar-eg&page=1');

    final List<MoviesEntity> moviesList = [];
    for (var movie in data['results']) {
      moviesList.add(MoviesModel.fromJson(movie));
    }

    return moviesList;
  }
}
