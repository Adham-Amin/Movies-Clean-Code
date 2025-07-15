import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/widgets/error_widget.dart';
import 'package:movies/Core/widgets/loading_widget.dart';
import 'package:movies/Features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies/Features/home/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies/Features/home/presentation/manager/upcoming_movies_cubit/upcoming_movies_cubit.dart';
import 'package:movies/Features/home/presentation/widgets/header_section_home.dart';
import 'package:movies/Features/home/presentation/widgets/new_releases_section.dart';
import 'package:movies/Features/home/presentation/widgets/recomended_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
            builder: (context, state) {
              if (state is PopularMoviesSuccess) {
                return HeaderSectionHome(movie: state.movies[0]);
              } else if (state is PopularMoviesFailure) {
                return FailureWidget(message: state.message);
              } else {
                return LoadingWidget();
              }
            },
          ),
          SizedBox(height: 100.h),
          BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
            builder: (context, state) {
              if (state is TopRatedMoviesSuccess) {
                return NewReleasesSection(movies: state.movies);
              } else if (state is TopRatedMoviesFailure) {
                return FailureWidget(message: state.message);
              } else {
                return LoadingWidget();
              }
            },
          ),
          const SizedBox(height: 24),
          BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
            builder: (context, state) {
              if (state is UpcomingMoviesSuccess) {
                return RecommendedSection(movies: state.movies);
              } else if (state is UpcomingMoviesFailure) {
                return FailureWidget(message: state.message);
              } else {
                return const LoadingWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}