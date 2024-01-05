import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/colors.dart';

class AppThemes {
  static const _appBarThemeLight = AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
  );

  static const _appBarThemeDark = const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
  );

  static ThemeData _generateThemeData({
    required Color background,
    required Color surface,
    required Color onSurface,
    required Color onSurfaceVariant,
    required Color outline,
    required Color outlineVariant,
    required Color primary,
    required Color secondary,
    required Color onSecondary,
    required Color tertiary,
    required Color onTertiary,
    required Color inversePrimary,
    required Color inverseSurface,
    required Color scrim,
    required Color shadow,
    required Brightness brightness,
  }) {
    return ThemeData(
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: inversePrimary, // Set the desired color
        ),
        headlineSmall: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: inversePrimary, // Set the desired color
        ),
        displayLarge: TextStyle(
            fontFamily: 'CerebriSansPro',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: inversePrimary),
        displayMedium: TextStyle(
            fontFamily: 'CerebriSansPro',
            fontSize: 16,
            height: 1.6,
            fontWeight: FontWeight.normal,
            color: inversePrimary),
        titleLarge: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: inversePrimary, // Set the desired color
        ),
        titleMedium: TextStyle(
            fontFamily: 'CerebriSansPro',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: onTertiary),
        bodySmall: TextStyle(
            fontFamily: 'CerebriSansPro',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: inversePrimary),
        bodyMedium: TextStyle(
            fontFamily: 'CerebriSansPro',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: inversePrimary),
        labelSmall: TextStyle(
            fontFamily: 'CerebriSansPro',
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: onTertiary
        ),
        labelMedium: TextStyle(
          fontFamily: 'CerebriSansPro',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: onTertiary
        ),
      ),
      appBarTheme: brightness == Brightness.light ? _appBarThemeLight : _appBarThemeDark,
      colorScheme: ColorScheme.fromSeed(
        background: background,
        surface: surface,
        onSurface: onSurface,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        primary: primary,
        secondary: secondary,
        onSecondary: onSecondary,
        tertiary: tertiary,
        onTertiary: onTertiary,
        inversePrimary: inversePrimary,
        inverseSurface: inverseSurface,
        seedColor: Colors.black,
        scrim: scrim,
        shadow: shadow,
        brightness: brightness,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData defaultLight = _generateThemeData(
    background: Colors.white,
    surface: Colors.white,
    onSurface: Colors.white,
    onSurfaceVariant: AppColors.secondaryGray,
    outline: AppColors.primaryBlack,
    outlineVariant: AppColors.disabledOutlineDefaultLight,
    primary: AppColors.primaryRed,
    secondary: AppColors.primaryBlue,
    onSecondary: AppColors.primaryBlue,
    tertiary: AppColors.primaryGray,
    onTertiary: AppColors.tertiaryDefaultLight,
    inversePrimary: Colors.black,
    inverseSurface: Colors.white,
    scrim: AppColors.disabledDefaultLight,
    shadow: Colors.grey.withOpacity(0.2),
    brightness: Brightness.light,
  );

  static ThemeData defaultDark = _generateThemeData(
    background: AppColors.backgroundBlack,
    surface: AppColors.darkSurface1,
    onSurface: Colors.white,
    onSurfaceVariant: AppColors.secondaryDefaultDark,
    outline: Colors.white,
    outlineVariant: AppColors.disabledOutlineDefaultDark,
    primary: AppColors.primaryRed,
    secondary: AppColors.primaryBlue,
    onSecondary: AppColors.primaryBlue,
    tertiary: AppColors.primaryGray,
    onTertiary: AppColors.tertiaryDefaultDark,
    inversePrimary: Colors.white,
    inverseSurface: Colors.black,
    scrim: AppColors.disabledDefaultLight,
    shadow: Colors.grey.withOpacity(0.2),
    brightness: Brightness.dark,
  );

  static ThemeData sakuraLight = _generateThemeData(
    background: Colors.white,
    surface: Colors.white,
    onSurface: AppColors.primarySakuraLight,
    onSurfaceVariant: AppColors.secondarySakuraLight,
    outline: AppColors.highSakuraLight,
    outlineVariant: AppColors.disabledOutlineSakuraLight,
    primary: AppColors.highSakuraLight,
    secondary: AppColors.mediumSakuraLight,
    onSecondary: AppColors.highSakuraLight,
    tertiary: AppColors.lowSakuraLight,
    onTertiary: AppColors.tertiarySakuraLight,
    inversePrimary: AppColors.primarySakuraLight,
    inverseSurface: Colors.white,
    scrim: AppColors.disabledDefaultLight,
    shadow: AppColors.highSakuraLight.withOpacity(0.2),
    brightness: Brightness.light,
  );

  static ThemeData sakuraDark = _generateThemeData(
    background: AppColors.backgroundBlack,
    surface: AppColors.darkSurface1,
    onSurface: Colors.white,
    onSurfaceVariant: AppColors.secondarySakuraDark,
    outline: AppColors.highSakuraDark,
    outlineVariant: AppColors.disabledOutlineSakuraDark,
    primary: AppColors.highSakuraDark,
    secondary: AppColors.mediumSakuraDark,
    onSecondary: AppColors.highSakuraDark,
    tertiary: AppColors.lowSakuraDark,
    onTertiary: AppColors.tertiarySakuraDark,
    inversePrimary: AppColors.primarySakuraDark,
    inverseSurface: Colors.black,
    scrim: AppColors.disabledDefaultLight,
    shadow: AppColors.highSakuraDark.withOpacity(0.2),
    brightness: Brightness.dark,
  );
}