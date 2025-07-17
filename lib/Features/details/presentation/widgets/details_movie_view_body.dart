import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/widgets/error_widget.dart';
import 'package:movies/Core/widgets/loading_widget.dart';
import 'package:movies/Features/details/presentation/manager/details_movie_cubit/details_movie_cubit.dart';
import 'package:movies/Features/details/presentation/widgets/movie_details_section.dart';
import 'package:movies/Features/details/presentation/widgets/similer_movies_section.dart';

class DetailsMovieViewBody extends StatefulWidget {
  const DetailsMovieViewBody({super.key, required this.movieId});

  final int movieId;

  @override
  State<DetailsMovieViewBody> createState() => _DetailsMovieViewBodyState();
}

class _DetailsMovieViewBodyState extends State<DetailsMovieViewBody> {
  @override
  void initState() {
    context.read<DetailsMovieCubit>().getDetailsMovie(movieId: widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsMovieCubit, DetailsMovieState>(
      builder: (context, state) {
        if (state is DetailsMovieSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                MovieDetailsSection(movie: state.movie),
                SimilerMoviesSection(id: state.movie.idMovie,),
                SizedBox(height: 24.h),
              ],
            ),
          );
        } else if (state is DetailsMovieFailure) {
          return FailureWidget(message: state.message);
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
