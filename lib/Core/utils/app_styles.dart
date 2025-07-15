import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle overview = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColors.softAsh,
  );
  static TextStyle textNormal14 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: Colors.white,
  );
  static TextStyle textNormal10 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: AppColors.softAsh,
  );
  static TextStyle textSemiBold25 = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 25.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textSemiBold18 = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textLight13 = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle textSemiBold13 = GoogleFonts.poppins(
    color: Colors.grey,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textSemiBold12 = GoogleFonts.poppins(
    color: Colors.grey,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textNormal16 = GoogleFonts.inter(
    color: Colors.grey,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textNormal15 = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    color: Colors.white,
  );
  static TextStyle textNormalPoppins10 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: Colors.white,
  );
  static TextStyle textNormal20 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    color: Colors.white,
  );
}
