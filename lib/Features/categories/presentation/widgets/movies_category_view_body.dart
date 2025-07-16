import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/widgets/error_widget.dart';
import 'package:movies/Core/widgets/poster_image.dart';
import 'package:movies/Features/categories/presentation/manager/movies_category_cubit/movies_category_cubit.dart';

class MoviesCategoryViewBody extends StatefulWidget {
  const MoviesCategoryViewBody({super.key, required this.id});

  final int id;

  @override
  State<MoviesCategoryViewBody> createState() => _MoviesCategoryViewBodyState();
}

class _MoviesCategoryViewBodyState extends State<MoviesCategoryViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesCategoryCubit>(
      context,
    ).getMoviesByCategory(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<MoviesCategoryCubit, MoviesCategoryState>(
        builder: (context, state) {
          if (state is MoviesCategorySuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder:
                  (context, index) =>
                      PosterImage(movie: state.moviesCategory[index]),
              itemCount: state.moviesCategory.length,
            );
          } else if (state is MoviesCategoryFailure) {
            return FailureWidget(message: state.message);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
