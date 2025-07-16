import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_colors.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';
import 'package:movies/Core/widgets/poster_image.dart';

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
