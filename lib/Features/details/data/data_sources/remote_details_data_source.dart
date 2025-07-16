import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Core/services/api_service.dart';
import 'package:movies/Features/details/data/models/details_movies_model/details_movies_model.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Features/home/data/models/movies_model.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';

abstract class RemoteDetailsDataSource {
  Future<DetailsMovieEntity> getMovieDetails({required int movieId});
  Future<List<MoviesEntity>> getMovieSimiler({required int movieId});
}

class RemoteDetailsDataSourceImpl implements RemoteDetailsDataSource {
  final ApiService apiService;

  RemoteDetailsDataSourceImpl({required this.apiService});
  @override
  Future<DetailsMovieEntity> getMovieDetails({required int movieId}) async {
    final data = await apiService.get(
      endPoint: '/movie/$movieId?language=en-US',
    );
    final movie = DetailsMovieModel.fromJson(data);

    final box = Hive.box<DetailsMovieEntity>('moviesDetails');
    box.put(movieId, movie);

    return movie;
  }

  @override
  Future<List<MoviesEntity>> getMovieSimiler({required int movieId}) async {
    final data = await apiService.get(
      endPoint: '/movie/$movieId/similar?language=en-US&page=1',
    );

    final moviesList =
        (data['results'] as List).map((e) => MoviesModel.fromJson(e)).toList();

    final box = Hive.box<MoviesEntity>('similerMovies');
    for (var movie in moviesList) {
      box.put(movie.idMovie, movie);
    }

    return moviesList;
  }
}
