import 'package:flutter/material.dart';

class AppColors {
  //light
  static const kPrimaryColorLight = Colors.blue;
  static const kScaffoldBackgroundLight = Colors.white;
  static const kButtonsForegroundColorLight = Colors.white;
  static const kAppBarHome1Light = Color(0xFF1565C0);
  static const kAppBarHome2Light = Color(0xFF42A5F5);
  static const kTextFieldLabelLight = Color(0xff0D47A1);
  static const kTextFieldHintLight = Colors.blueGrey;

  //dark
  static const kPrimarColorDark = Colors.grey;
  static const kScaffoldBackgroundDark = Color(0xFF17263B);
  static const kAppBarHome1Dark = Color(0xFF243B55);
  static const kAppBarHome2Dark = Color(0xFF243B55);
  static const kButtonsForegroundColorDark = Colors.black;
  static const kTextFieldLabelDark = Colors.grey;
  static const kTextFieldHintDark = Colors.grey;
}

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
