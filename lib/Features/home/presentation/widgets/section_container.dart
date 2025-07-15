import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/utils/app_colors.dart';
import 'package:movies/Core/utils/app_styles.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final double height;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const SectionContainer({
    super.key,
    required this.title,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ironNight,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          Text(title, style: AppStyles.textSemiBold18),
          SizedBox(height: 12.h),
          SizedBox(
            height: height,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: itemBuilder,
              separatorBuilder: (_, __) => SizedBox(width: 16.w),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
