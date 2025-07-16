import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_colors.dart';
import 'package:movies/Core/utils/app_styles.dart';

class NoMovies extends StatelessWidget {
  const NoMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.tv_off_outlined, size: 80.sp, color: AppColors.goldenHoney),
          SizedBox(height: 8.h),
          Text('No Movies Found', style: AppStyles.textLight13),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}