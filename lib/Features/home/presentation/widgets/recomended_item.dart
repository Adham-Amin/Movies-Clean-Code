import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_colors.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Features/home/domain/entities/movies_entity.dart';
import 'package:movies/Features/home/presentation/widgets/poster_image.dart';

class RecomendedItem extends StatelessWidget {
  const RecomendedItem({super.key, required this.movie});

  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PosterImage(image: movie.posterUrl),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Row(
            children: [
              Icon(Icons.star, color: AppColors.goldenHoney, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                movie.rating.toString(),
                style: AppStyles.textNormalPoppins10,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Text(movie.name, style: AppStyles.textNormalPoppins10),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Text(movie.publishedDate, style: AppStyles.textNormal10),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}