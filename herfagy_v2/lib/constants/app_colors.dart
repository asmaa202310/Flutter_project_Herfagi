import 'package:flutter/material.dart';

class AppColors {
  // Light Mode Colors
  static const Color lightPrimary = Color(0xFF1565C0);
  static const Color lightPrimaryVariant = Color(0xFF42A5F5);
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFF9F9F9);
  static const Color lightText = Color(0xFF212121);
  static const Color lightGrey = Color(0xFF757575);
  static const Color lightAccent = Color(0xFF4285F4);
  static const Color lightError = Color(0xFFD32F2F);

  // Dark Mode Colors
  static const Color darkPrimary = Color(0xFF90CAF9);
  static const Color darkPrimaryVariant = Color(0xFF42A5F5);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkGrey = Color(0xFFBDBDBD);
  static const Color darkAccent = Color(0xFF64B5F6);
  static const Color darkError = Color(0xFFEF5350);

  // Helper for opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: AppColors.lightText,
      elevation: 0,
      centerTitle: true,
    ),
    cardColor: AppColors.lightCard,
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightAccent,
      surface: AppColors.lightBackground,
      error: AppColors.lightError,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: AppColors.lightText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightText),
      bodyMedium: TextStyle(color: AppColors.lightGrey),
      titleLarge: TextStyle(color: AppColors.lightText),
      titleMedium: TextStyle(color: AppColors.lightText),
      labelLarge: TextStyle(color: AppColors.lightText),
      bodySmall: TextStyle(color: AppColors.lightGrey),
    ),
    iconTheme: const IconThemeData(color: AppColors.lightPrimary),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: AppColors.darkText,
      elevation: 0,
      centerTitle: true,
    ),
    cardColor: AppColors.darkCard,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkAccent,
      surface: AppColors.darkBackground,
      error: AppColors.darkError,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: AppColors.darkText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkText),
      bodyMedium: TextStyle(color: AppColors.darkGrey),
      titleLarge: TextStyle(color: AppColors.darkText),
      titleMedium: TextStyle(color: AppColors.darkText),
      labelLarge: TextStyle(color: AppColors.darkText),
      bodySmall: TextStyle(color: AppColors.darkGrey),
    ),
    iconTheme: const IconThemeData(color: AppColors.darkPrimary),
  );
}
