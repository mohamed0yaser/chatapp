import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.primary,
      surface: AppColors.surface,
      onSurface: AppColors.primary,
      error: AppColors.error,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.primary),
      bodyMedium: TextStyle(color: AppColors.primary),
      bodySmall: TextStyle(color: AppColors.chatTimestamp),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.authInput,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.secondary),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.navBar,
      selectedItemColor: AppColors.navActive,
      unselectedItemColor: AppColors.navIcon,
    ),
    chipTheme: const ChipThemeData(
      backgroundColor: AppColors.surface,
      selectedColor: AppColors.secondary,
      labelStyle: TextStyle(color: AppColors.primary),
      secondaryLabelStyle: TextStyle(color: Colors.white),
      brightness: Brightness.light,
    ),
  );
}
