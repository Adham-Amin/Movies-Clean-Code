import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_colors.dart';
import 'package:movies/Core/utils/app_styles.dart';

class GenreItem extends StatelessWidget {
  const GenreItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.goldenHoney, width: 1.w),
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      alignment: Alignment.center,
      child: Text(title, style: AppStyles.textNormalPoppins10),
    );
  }
}
