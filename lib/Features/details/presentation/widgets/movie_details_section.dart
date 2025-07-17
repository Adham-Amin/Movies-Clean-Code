import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/widgets/custom_network_image.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Features/details/presentation/widgets/movie_info.dart';

class MovieDetailsSection extends StatelessWidget {
  const MovieDetailsSection({super.key, required this.movie});

  final DetailsMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200.h,
          child: CustomCachedNetworkImage(image: movie.backgroundImage),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: MovieInfo(movie: movie),
        ),
      ],
    );
  }
}
