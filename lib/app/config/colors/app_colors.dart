// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 205, 62, 22);
  static const Color secondary = Color(0xFF022653);
  static const Color cabeceraAdmin = Color(0xFF022653);
  static const Color cabeceraUser = Color.fromARGB(255, 205, 62, 22);

  static MaterialColor from(Color color) {
    return MaterialColor(color.value, <int, Color>{
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    });
  }
}
