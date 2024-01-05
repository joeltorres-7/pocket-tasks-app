import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/colors.dart';

class AppThemes {
  static final _appBarThemeLight = AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
  );

  static final _appBarThemeDark = AppBarTheme(
    color: AppColors.primaryWhite,
    iconTheme: IconThemeData(color: AppColors.primaryWhite),
  );

  static ThemeData _generateThemeData({
    required Color background,
    required Color surface,
    required Color surfaceVariant,
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
    required Color onInverseSurface,
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
            color: onTertiary),
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
            color: onTertiary),
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
        surfaceVariant: surfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        primary: primary,
        secondary: secondary,
        onSecondary: onSecondary,
        tertiary: tertiary,
        onTertiary: onTertiary,
        inversePrimary: inversePrimary,
        inverseSurface: inverseSurface,
        onInverseSurface: onInverseSurface,
        seedColor: Colors.black,
        scrim: scrim,
        shadow: shadow,
        brightness: brightness,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData defaultLight = _generateThemeData(
    background: AppColors.primaryWhite,
    surface: AppColors.primaryWhite,
    surfaceVariant: AppColors.disabledDefaultLight,
    onSurface: AppColors.primaryWhite,
    onSurfaceVariant: AppColors.secondaryGray,
    outline: AppColors.primaryBlack,
    outlineVariant: AppColors.disabledOutlineDefaultLight,
    primary: AppColors.primaryRed,
    secondary: AppColors.primaryBlue,
    onSecondary: AppColors.primaryBlue,
    tertiary: AppColors.primaryGray,
    onTertiary: AppColors.tertiaryDefaultLight,
    inversePrimary: Colors.black,
    inverseSurface: AppColors.primaryWhite,
    onInverseSurface: AppColors.outlineDefaultLight,
    scrim: AppColors.disabledDefaultLight,
    shadow: Colors.grey.withOpacity(0.2),
    brightness: Brightness.light,
  );

  static ThemeData defaultDark = _generateThemeData(
    background: AppColors.backgroundBlack,
    surface: AppColors.darkSurface1,
    surfaceVariant: AppColors.disabledDefaultDark,
    onSurface: AppColors.primaryWhite,
    onSurfaceVariant: AppColors.secondaryDefaultDark,
    outline: AppColors.primaryWhite,
    outlineVariant: AppColors.disabledOutlineDefaultDark,
    primary: AppColors.primaryRed,
    secondary: AppColors.primaryBlue,
    onSecondary: AppColors.primaryBlue,
    tertiary: AppColors.primaryGray,
    onTertiary: AppColors.tertiaryDefaultDark,
    inversePrimary: AppColors.primaryWhite,
    inverseSurface: Colors.black,
    onInverseSurface: AppColors.outlineDefaultDark,
    scrim: AppColors.disabledDefaultLight,
    shadow: Colors.grey.withOpacity(0.2),
    brightness: Brightness.dark,
  );

  // Sakura Theme Colors

  static ThemeData sakuraLight = _generateThemeData(
    background: AppColors.primaryWhite,
    surface: AppColors.primaryWhite,
    surfaceVariant: AppColors.disabledSakuraLight,
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
    inverseSurface: AppColors.primaryWhite,
    onInverseSurface: AppColors.outlineSakuraLight,
    scrim: AppColors.disabledDefaultLight,
    shadow: AppColors.highSakuraLight.withOpacity(0.2),
    brightness: Brightness.light,
  );

  static ThemeData sakuraDark = _generateThemeData(
    background: AppColors.backgroundBlack,
    surface: AppColors.darkSurface1,
    surfaceVariant: AppColors.disabledSakuraDark,
    onSurface: AppColors.primaryWhite,
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
    onInverseSurface: AppColors.outlineSakuraDark,
    scrim: AppColors.disabledDefaultLight,
    shadow: AppColors.highSakuraDark.withOpacity(0.2),
    brightness: Brightness.dark,
  );

  // Orange Breakfast Theme Colors

  static ThemeData orangeBreakfastLight = _generateThemeData(
    background: AppColors.primaryWhite,
    surface: AppColors.primaryWhite,
    surfaceVariant: AppColors.disabledOrangeLight,
    onSurface: AppColors.primaryOrangeLight,
    onSurfaceVariant: AppColors.secondaryOrangeLight,
    outline: AppColors.highOrangeLight,
    outlineVariant: AppColors.disabledOutlineOrangeLight,
    primary: AppColors.highOrangeLight,
    secondary: AppColors.mediumOrangeLight,
    onSecondary: AppColors.highOrangeLight,
    tertiary: AppColors.lowOrangeLight,
    onTertiary: AppColors.tertiaryOrangeLight,
    inversePrimary: AppColors.primaryOrangeLight,
    inverseSurface: AppColors.primaryWhite,
    onInverseSurface: AppColors.outlineOrangeLight,
    scrim: AppColors.disabledDefaultLight,
    shadow: AppColors.highOrangeLight.withOpacity(0.2),
    brightness: Brightness.light,
  );

  static ThemeData orangeBreakfastDark = _generateThemeData(
    background: AppColors.backgroundBlack,
    surface: AppColors.darkSurface1,
    surfaceVariant: AppColors.disabledOrangeDark,
    onSurface: AppColors.primaryWhite,
    onSurfaceVariant: AppColors.secondaryOrangeDark,
    outline: AppColors.highOrangeDark,
    outlineVariant: AppColors.disabledOutlineOrangeDark,
    primary: AppColors.highOrangeDark,
    secondary: AppColors.mediumOrangeDark,
    onSecondary: AppColors.highOrangeDark,
    tertiary: AppColors.lowOrangeDark,
    onTertiary: AppColors.tertiaryOrangeDark,
    inversePrimary: AppColors.primaryOrangeDark,
    inverseSurface: Colors.black,
    onInverseSurface: AppColors.outlineOrangeDark,
    scrim: AppColors.disabledDefaultLight,
    shadow: AppColors.highOrangeDark.withOpacity(0.2),
    brightness: Brightness.dark,
  );
}