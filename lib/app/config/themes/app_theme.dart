import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTheme {
  ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.primary,
      ),
      //scaffoldBackgroundColor: AppColors.primary,
      primaryColor: AppColors.primary,
      splashColor: Colors.transparent,
      fontFamily: 'Hind',
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
        selectedItemColor: Colors.purple,
      ),
    );
  }
}
