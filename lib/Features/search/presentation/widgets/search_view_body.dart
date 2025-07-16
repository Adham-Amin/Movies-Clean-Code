import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_colors.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Core/widgets/error_widget.dart';
import 'package:movies/Core/widgets/loading_widget.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';
import 'package:movies/Features/home/presentation/widgets/poster_image.dart';
import 'package:movies/Features/search/presentation/manager/cubit/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          CustomTextField(
            onChanged:
                (movieQuery) => BlocProvider.of<SearchCubit>(
                  context,
                ).searchMovies(movieQuery: movieQuery),
          ),
          SizedBox(height: 16.h),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccess) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.movies.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                    itemBuilder:
                        (context, index) =>
                            SearchMovieItem(movie: state.movies[index]),
                  ),
                );
              } else if (state is SearchFailure) {
                return FailureWidget(message: state.message);
              } else if (state is SearchLoading) {
                return const LoadingWidget();
              } else {
                return const NoMovies();
              }
            },
          ),
        ],
      ),
    );
  }
}

class SearchMovieItem extends StatelessWidget {
  const SearchMovieItem({super.key, required this.movie});

  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PosterImage(image: movie.posterUrl),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.name, style: AppStyles.textNormal15),
              SizedBox(height: 4.h),
              Text(movie.publishedDate, style: AppStyles.textSemiBold13),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.goldenHoney, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    movie.rating.toString(),
                    style: AppStyles.textSemiBold13,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: AppStyles.textLight13,
      cursorColor: AppColors.goldenHoney,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.goldenHoney),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.goldenHoney),
        ),
        hintText: 'Search for a movie',
        hintStyle: AppStyles.textLight13,
      ),
    );
  }
}

class NoMovies extends StatelessWidget {
  const NoMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80.sp, color: AppColors.goldenHoney),
          SizedBox(height: 8.h),
          Text('No Movies Found', style: AppStyles.textLight13),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
