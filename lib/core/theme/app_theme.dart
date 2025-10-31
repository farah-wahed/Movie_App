
import 'dart:ui';
import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme =
   ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontFamily: FontFamily.inter,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontFamily: FontFamily.inter,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontFamily: FontFamily.inter,
            fontWeight: FontWeight.w700,
            color: Colors.white,


          ),
          bodyLarge : TextStyle(
            fontFamily: FontFamily.inter,
            fontWeight: FontWeight.w400,
            color: Colors.white,


          ),
        ),

     appBarTheme: AppBarTheme(
       backgroundColor: Colors.transparent,
       centerTitle: true,
       iconTheme: IconThemeData(color: AppColors.primary),
       titleTextStyle: TextStyle(
         fontFamily: FontFamily.inter,
         fontWeight: FontWeight.w500,
         fontSize: 16,
         color: AppColors.primary,
       ),
     ),
   );

}
