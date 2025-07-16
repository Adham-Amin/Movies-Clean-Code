import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_colors.dart';
import 'package:movies/Core/utils/app_styles.dart';
import 'package:movies/Core/widgets/custom_network_image.dart';
import 'package:movies/Core/domain/entities/movies_entity.dart';
import 'package:movies/Core/widgets/poster_image.dart';

class HeaderSectionHome extends StatelessWidget {
  const HeaderSectionHome({super.key, required this.movie});

  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(width: double.infinity, child: CustomCachedNetworkImage(image: movie.bkgroundUrl)),
          Positioned(
            left: 24.w,
            bottom: -80.h,
            child: Row(
              children: [
                PosterImage(image: movie.posterUrl),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 120.h),
                    Text(movie.name, style: AppStyles.textNormal14),
                    SizedBox(height: 4.h),
                    Text(
                      '${movie.publishedDate}  ',
                      style: AppStyles.textNormal10,
                    ),
                    
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.goldenHoney,
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '${movie.rating}',
                          style: AppStyles.textNormal10,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}