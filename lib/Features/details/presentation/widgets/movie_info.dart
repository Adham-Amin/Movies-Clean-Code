import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_colors.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Core/widgets/custom_network_image.dart';
import 'package:movies/Features/details/domain/entities/details_movie_entity.dart';
import 'package:movies/Features/details/presentation/widgets/genre_item.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.movie});

  final DetailsMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movie.name, style: AppStyles.textSemiBold18),
        SizedBox(height: 3.h),
        Text(movie.publishedDate, style: AppStyles.textNormalPoppins10),
        SizedBox(height: 16.h),
        Row(
          children: [
            SizedBox(
              width: 120.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CustomCachedNetworkImage(image: movie.posterImage),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8.w,
                      children:
                          movie.genresList
                              .map((e) => GenreItem(title: e.genreName))
                              .toList(),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(movie.description, style: AppStyles.textNormalPoppins10),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.goldenHoney, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        movie.rating.toString(),
                        style: AppStyles.textSemiBold18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Text('More Like This', style: AppStyles.textNormal15),
        SizedBox(height: 8.h),
      ],
    );
  }
}
