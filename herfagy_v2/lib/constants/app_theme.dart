import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'NotoSansArabic_Condensed-Regular',
    scaffoldBackgroundColor: AppColors.kScaffoldBackgroundLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.kPrimaryColorLight),
        foregroundColor: WidgetStateProperty.all(
          AppColors.kButtonsForegroundColorLight,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      hintStyle: TextStyle(color: AppColors.kTextFieldHintLight),
      labelStyle: TextStyle(color: AppColors.kTextFieldLabelLight),
      // fillColor: Colors.grey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'NotoSansArabic_Condensed-Regular',
    scaffoldBackgroundColor: AppColors.kScaffoldBackgroundDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.kPrimarColorDark),
        foregroundColor: WidgetStateProperty.all(
          AppColors.kButtonsForegroundColorDark,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      hintStyle: TextStyle(color: AppColors.kTextFieldHintDark),
      labelStyle: TextStyle(color: AppColors.kTextFieldLabelDark),
      // fillColor: Colors.grey,
    ),
  );
}
