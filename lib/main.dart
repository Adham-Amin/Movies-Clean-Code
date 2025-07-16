import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/Core/functions/on_generate_route.dart';
import 'package:movies/Core/services/getit_service.dart';
import 'package:movies/Core/utils/app_theme.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Features/details/domain/entities/genre_entity.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';
import 'package:movies/Features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies/Features/home/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies/Features/home/presentation/manager/upcoming_movies_cubit/upcoming_movies_cubit.dart';
import 'Features/splash/presentation/views/splash_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MoviesEntityAdapter());
  Hive.registerAdapter(DetailsMovieEntityAdapter());
  Hive.registerAdapter(GenreEntityAdapter());
  await Hive.openBox('popularMovies');
  await Hive.openBox('topRatedMovies');
  await Hive.openBox('upcomingMovies');
  await Hive.openBox('moviesDetails');
  await setupGetit();

  runApp(const Movies());
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => getIt.get<PopularMoviesCubit>()..getPopularMovies(),
        ),
        BlocProvider(
          create:
              (context) =>
                  getIt.get<TopRatedMoviesCubit>()..getTopRatedMovies(),
        ),
        BlocProvider(
          create:
              (context) =>
                  getIt.get<UpcomingMoviesCubit>()..getUpcomingMovies(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(412, 892),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashView.routeName,
          );
        },
      ),
    );
  }
}