import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTheme {
  ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.primary,
      splashColor: Colors.transparent,
      fontFamily: 'Montserrat',
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
        selectedItemColor: Colors.purple,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          maximumSize: const Size.fromHeight(54),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.blueGrey[50],
      primarySwatch: AppColors.from(AppColors.secondary),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.from(AppColors.secondary),
        accentColor: const Color.fromARGB(255, 205, 62, 22),
        backgroundColor: Colors.white,
      ),
    );
  }
}
