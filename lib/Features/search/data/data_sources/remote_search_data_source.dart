import 'package:movies/Core/services/api_service.dart';
import 'package:movies/Features/home/data/models/movies_model.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';

abstract class RemoteSearchDataSource {
  Future<List<MoviesEntity>> searchMovies({required String movieQuery});
}

class RemoteSearchDataSourceImpl implements RemoteSearchDataSource {
  final ApiService apiService;

  RemoteSearchDataSourceImpl({required this.apiService});
  @override
  Future<List<MoviesEntity>> searchMovies({required String movieQuery}) async {
    var data = await apiService.get(
      endPoint: '/search/movie?query=$movieQuery&language=en-US&page=1',
    );

    List<MoviesEntity> moviesList = [];
    for (var movie in data['results']) {
      moviesList.add(MoviesModel.fromJson(movie));
    }
    
    return moviesList;
  }
}
