import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';
import 'package:movies/Features/search/domain/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> searchMovies({required String movieQuery}) async {
    emit(SearchLoading());
    final result = await searchRepo.searchMovies(movieQuery: movieQuery);
    result.fold(
      (failure) => emit(SearchFailure(message: failure.message)),
      (movies) => emit(SearchSuccess(movies: movies)),
    );
  }
}
