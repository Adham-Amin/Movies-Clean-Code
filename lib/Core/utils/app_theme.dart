import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.shadowMoss,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.shadowMoss,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.goldenHoney,
      unselectedItemColor: AppColors.charcoalGray,
      elevation: 10,
      showSelectedLabels: true,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
