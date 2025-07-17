import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/widgets/custom_network_image.dart';
import 'package:movies/Core/widgets/error_widget.dart';
import 'package:movies/Core/widgets/loading_widget.dart';
import 'package:movies/Features/details/presentation/manager/similer_movie_cubit/similer_movie_cubit.dart';
import 'package:movies/Features/details/presentation/views/details_movie_view.dart';

class SimilerMoviesSection extends StatefulWidget {
  const SimilerMoviesSection({super.key, required this.id});

  final int id;
  
  @override
  State<SimilerMoviesSection> createState() => _SimilerMoviesSectionState();
}

class _SimilerMoviesSectionState extends State<SimilerMoviesSection> {
  @override
  void initState() {
    context.read<SimilerMovieCubit>().getSimilerMovie(movieId: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        height: 200.h,
        child: BlocBuilder<SimilerMovieCubit, SimilerMovieState>(
          builder: (context, state) {
            if (state is SimilerMovieSuccess) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(width: 12.h),
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap:
                          () => Navigator.pushNamed(
                            context,
                            DetailsMovieView.routeName,
                            arguments: state.similerMovies[index].idMovie,
                          ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CustomCachedNetworkImage(
                          image: state.similerMovies[index].posterUrl,
                        ),
                      ),
                    ),
              );
            } else if (state is SimilerMovieFailure) {
              return FailureWidget(message: state.message);
            } else {
              return LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
