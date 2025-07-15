import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/Core/services/api_service.dart';
import 'package:movies/Features/home/data/data_sources/local_home_data_source.dart';
import 'package:movies/Features/home/data/data_sources/remote_home_data_source.dart';
import 'package:movies/Features/home/data/repos/home_repo_impl.dart';
import 'package:movies/Features/home/domain/repos/home_repo.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<RemoteHomeDataSource>(
    RemoteHomeDataSourceImpl(api: getIt<ApiService>()),
  );

  getIt.registerSingleton<LocalHomeDataSource>(LocalHomeDataSourceImpl());

  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      localHomeDataSource: getIt<LocalHomeDataSource>(),
      remoteHomeDataSource: getIt<RemoteHomeDataSource>(),
    ),
  );
}
