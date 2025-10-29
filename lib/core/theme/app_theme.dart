import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: AppColors.text),
      ),
      fontFamily: '',
    );
  }
}
