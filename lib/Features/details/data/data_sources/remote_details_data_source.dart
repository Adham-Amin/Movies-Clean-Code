import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Core/services/api_service.dart';
import 'package:movies/Features/details/data/models/details_movies_model/details_movies_model.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Features/home/data/models/movies_model.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

abstract class RemoteDetailsDataSource {
  Future<DetailsMovieEntity> getMovieDetails({required int movieId});
  Future<List<MoviesEntity>> getMovieSimiler({required int movieId});
}

class RemoteDetailsDataSourceImpl implements RemoteDetailsDataSource {
  final ApiService apiService;

  RemoteDetailsDataSourceImpl({required this.apiService});
  @override
  Future<DetailsMovieEntity> getMovieDetails({required int movieId}) async {
    var data = await apiService.get(endPoint: '/$movieId?language=en-US');
    var movie = DetailsMovieModel.fromJson(data);

    var box = Hive.box('moviesDetails');
    box.put(movieId, movie);

    return movie;
  }

  @override
  Future<List<MoviesEntity>> getMovieSimiler({required int movieId}) async {
    var data = await apiService.get(
      endPoint: '/$movieId/similar?language=en-US&page=1',
    );

    List<MoviesEntity> moviesList = [];
    for (var movie in data['results']) {
      moviesList.add(MoviesModel.fromJson(movie));
    }

    var box = Hive.box('moviesDetails');
    box.put(movieId, moviesList);
    
    return moviesList;
  }
}
