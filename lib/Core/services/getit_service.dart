import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/Core/services/api_service.dart';
import 'package:movies/Features/categories/data/data_sources/local_categories_data_source.dart';
import 'package:movies/Features/categories/data/data_sources/remote_categories_data_source.dart';
import 'package:movies/Features/categories/data/repos/categories_repo_impl.dart';
import 'package:movies/Features/categories/domain/repos/categories_repo.dart';
import 'package:movies/Features/categories/presentation/manager/categories_cubit.dart';
import 'package:movies/Features/details/data/data_sources/local_details_data_source.dart';
import 'package:movies/Features/details/data/data_sources/remote_details_data_source.dart';
import 'package:movies/Features/details/data/repos/details_repo_impl.dart';
import 'package:movies/Features/details/domain/repos/details_repo.dart';
import 'package:movies/Features/details/presentation/manager/details_movie_cubit/details_movie_cubit.dart';
import 'package:movies/Features/details/presentation/manager/similer_movie_cubit/similer_movie_cubit.dart';
import 'package:movies/Features/home/data/data_sources/local_home_data_source.dart';
import 'package:movies/Features/home/data/data_sources/remote_home_data_source.dart';
import 'package:movies/Features/home/data/repos/home_repo_impl.dart';
import 'package:movies/Features/home/domain/repos/home_repo.dart';
import 'package:movies/Features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies/Features/home/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies/Features/home/presentation/manager/upcoming_movies_cubit/upcoming_movies_cubit.dart';
import 'package:movies/Features/search/data/data_sources/remote_search_data_source.dart';
import 'package:movies/Features/search/data/repos/search_repo_impl.dart';
import 'package:movies/Features/search/domain/repos/search_repo.dart';
import 'package:movies/Features/search/presentation/manager/cubit/search_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<RemoteHomeDataSource>(
    RemoteHomeDataSourceImpl(api: getIt<ApiService>()),
  );

  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      localHomeDataSource: LocalHomeDataSourceImpl(),
      remoteHomeDataSource: getIt<RemoteHomeDataSource>(),
    ),
  );

  getIt.registerSingleton<RemoteDetailsDataSourceImpl>(
    RemoteDetailsDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<DetailsRepo>(
    DetailsRepoImpl(
      localDetailsDataSource: LocalDetailsDataSourceImpl(),
      remoteDetailsDataSource: getIt<RemoteDetailsDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton<RemoteSearchDataSourceImpl>(
    RemoteSearchDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(remoteSearchDataSource: getIt<RemoteSearchDataSourceImpl>()),
  );

  getIt.registerSingleton<RemoteCategoriesDataSourceImpl>(
    RemoteCategoriesDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<CategoriesRepo>(
    CategoriesRepoImpl(
      localCategoriesDataSource: LocalCategoriesDataSourceImpl(),
      remoteCategoriesDataSource: getIt<RemoteCategoriesDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton(UpcomingMoviesCubit(homeRepo: getIt<HomeRepo>()));
  getIt.registerSingleton(PopularMoviesCubit(homeRepo: getIt<HomeRepo>()));
  getIt.registerSingleton(TopRatedMoviesCubit(homeRepo: getIt<HomeRepo>()));
  getIt.registerSingleton<SearchCubit>(
    SearchCubit(searchRepo: getIt<SearchRepo>()),
  );
  getIt.registerSingleton<DetailsMovieCubit>(
    DetailsMovieCubit(detailsRepo: getIt<DetailsRepo>()),
  );
  getIt.registerSingleton<SimilerMovieCubit>(
    SimilerMovieCubit(detailsRepo: getIt<DetailsRepo>()),
  );
  getIt.registerSingleton<CategoriesCubit>(
    CategoriesCubit(categoriesRepo: getIt<CategoriesRepo>()),
  );
}
