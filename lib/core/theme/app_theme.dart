import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillhub/core/theme/app_colors.dart';

abstract final class AppTheme {
  static const _fontFamilyFallback = <String>[
    'Roboto',
    'Arial',
    'Tahoma',
    'sans-serif',
  ];

  static ThemeData get lightTheme {
    final baseTheme = ThemeData.light();
    final textTheme = GoogleFonts.cairoTextTheme(baseTheme.textTheme).apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
      fontFamilyFallback: _fontFamilyFallback,
    );
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.border),
    );

    return ThemeData(
      useMaterial3: true,
      fontFamilyFallback: _fontFamilyFallback,
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.navy,
        primary: AppColors.accentBlueDark,
        secondary: AppColors.greenBright,
        surface: AppColors.white,
        onSurface: AppColors.textPrimary,
      ),
      cardColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.navy),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.accentBlueDark,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      dividerColor: AppColors.border,
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        modalBackgroundColor: AppColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentBlueDark,
          foregroundColor: AppColors.white,
          elevation: 0,
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentBlueDark,
        foregroundColor: AppColors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white.withValues(alpha: 0.94),
        hintStyle: const TextStyle(color: AppColors.mutedText),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: AppColors.navy),
        ),
        border: border,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? AppColors.white
              : AppColors.white;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? AppColors.greenBright
              : AppColors.border;
        }),
      ),
    );
  }

  static ThemeData get darkTheme {
    const background = Color(0xFF101626);
    const surface = Color(0xFF171F33);
    const surfaceHigh = Color(0xFF202A42);
    const borderColor = Color(0xFF2D3855);
    const textPrimary = Color(0xFFEAF0F7);
    const textSecondary = Color(0xFFAFBAC8);

    final baseTheme = ThemeData.dark();
    final textTheme = GoogleFonts.cairoTextTheme(baseTheme.textTheme).apply(
      bodyColor: textPrimary,
      displayColor: textPrimary,
      fontFamilyFallback: _fontFamilyFallback,
    );
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: borderColor),
    );

    return ThemeData(
      useMaterial3: true,
      fontFamilyFallback: _fontFamilyFallback,
      textTheme: textTheme,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentBlue,
        secondary: AppColors.greenBright,
        surface: surface,
        onSurface: textPrimary,
        outline: borderColor,
      ),
      cardColor: surface,
      iconTheme: const IconThemeData(color: textPrimary),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.accentBlueDark,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      dividerColor: borderColor,
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w800,
        ),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: textSecondary,
          height: 1.5,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: surface,
        modalBackgroundColor: surface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentBlue,
        foregroundColor: AppColors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceHigh,
        hintStyle: const TextStyle(color: textSecondary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: AppColors.accentBlue),
        ),
        border: border,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(AppColors.white),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? AppColors.greenBright
              : borderColor;
        }),
      ),
    );
  }
}
