import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/widgets/error_widget.dart';
import 'package:movies/Core/widgets/loading_widget.dart';
import 'package:movies/Features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:movies/Features/search/presentation/widgets/custom_text_field.dart';
import 'package:movies/Features/search/presentation/widgets/no_movies.dart';
import 'package:movies/Features/search/presentation/widgets/search_movie_item.dart';

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
