import 'package:flutter/material.dart';

/// Application color palette.
///
/// WCAG 2.1 Level AA compliant color schemes.
/// - Normal text (4.5:1 contrast ratio)
/// - Large text (3:1 contrast ratio)
/// - UI components (3:1 contrast ratio)
abstract final class AppColors {
  // ============================================
  // LIGHT THEME COLORS
  // ============================================

  // Primary colors - Purple (WCAG AA compliant)
  static const Color primary = Color(0xFF5B4FC4); // Darker for better contrast
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFE8DDFF);
  static const Color onPrimaryContainer = Color(0xFF1B0261);

  // Secondary colors - Muted purple
  static const Color secondary = Color(0xFF5D5C72);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE2E0F9);
  static const Color onSecondaryContainer = Color(0xFF1A1A2C);

  // Tertiary colors - Rose
  static const Color tertiary = Color(0xFF7A5369);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFFD8E8);
  static const Color onTertiaryContainer = Color(0xFF2E1125);

  // Error colors - Red with good contrast
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);

  // Success colors
  static const Color success = Color(0xFF1B6D3B);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFA6F5B4);
  static const Color onSuccessContainer = Color(0xFF00210C);

  // Warning colors
  static const Color warning = Color(0xFF7A5900);
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color warningContainer = Color(0xFFFFDEA6);
  static const Color onWarningContainer = Color(0xFF261A00);

  // Info colors
  static const Color info = Color(0xFF00658E);
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color infoContainer = Color(0xFFC6E7FF);
  static const Color onInfoContainer = Color(0xFF001E2E);

  // Surface colors - Light theme
  static const Color surface = Color(0xFFFCF8FF);
  static const Color onSurface = Color(0xFF1C1B20);
  static const Color surfaceVariant = Color(0xFFE6E0EC);
  static const Color onSurfaceVariant = Color(0xFF48454E);
  static const Color surfaceDim = Color(0xFFDDD8E0);
  static const Color surfaceBright = Color(0xFFFCF8FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF7F2FA);
  static const Color surfaceContainer = Color(0xFFF1ECF4);
  static const Color surfaceContainerHigh = Color(0xFFEBE6EE);
  static const Color surfaceContainerHighest = Color(0xFFE5E1E9);

  // Outline colors
  static const Color outline = Color(0xFF79757F);
  static const Color outlineVariant = Color(0xFFCAC4CF);

  // Inverse colors
  static const Color inverseSurface = Color(0xFF313035);
  static const Color onInverseSurface = Color(0xFFF4EFF7);
  static const Color inversePrimary = Color(0xFFCDBDFF);

  // Other colors
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);
  static const Color surfaceTint = primary;

  // ============================================
  // DARK THEME COLORS
  // ============================================

  // Primary colors - Dark theme (WCAG AA compliant)
  static const Color primaryDark = Color(0xFFCDBDFF);
  static const Color onPrimaryDark = Color(0xFF331F91);
  static const Color primaryContainerDark = Color(0xFF4A37AB);
  static const Color onPrimaryContainerDark = Color(0xFFE8DDFF);

  // Secondary colors - Dark theme
  static const Color secondaryDark = Color(0xFFC6C3DD);
  static const Color onSecondaryDark = Color(0xFF2F2E42);
  static const Color secondaryContainerDark = Color(0xFF45445A);
  static const Color onSecondaryContainerDark = Color(0xFFE2E0F9);

  // Tertiary colors - Dark theme
  static const Color tertiaryDark = Color(0xFFEBB9CF);
  static const Color onTertiaryDark = Color(0xFF46263A);
  static const Color tertiaryContainerDark = Color(0xFF5F3C51);
  static const Color onTertiaryContainerDark = Color(0xFFFFD8E8);

  // Error colors - Dark theme
  static const Color errorDark = Color(0xFFFFB4AB);
  static const Color onErrorDark = Color(0xFF690005);
  static const Color errorContainerDark = Color(0xFF93000A);
  static const Color onErrorContainerDark = Color(0xFFFFDAD6);

  // Success colors - Dark theme
  static const Color successDark = Color(0xFF8AD899);
  static const Color onSuccessDark = Color(0xFF00391A);
  static const Color successContainerDark = Color(0xFF00522A);
  static const Color onSuccessContainerDark = Color(0xFFA6F5B4);

  // Warning colors - Dark theme
  static const Color warningDark = Color(0xFFF9BD48);
  static const Color onWarningDark = Color(0xFF412D00);
  static const Color warningContainerDark = Color(0xFF5D4200);
  static const Color onWarningContainerDark = Color(0xFFFFDEA6);

  // Info colors - Dark theme
  static const Color infoDark = Color(0xFF82CFFF);
  static const Color onInfoDark = Color(0xFF00344C);
  static const Color infoContainerDark = Color(0xFF004C6C);
  static const Color onInfoContainerDark = Color(0xFFC6E7FF);

  // Surface colors - Dark theme
  static const Color surfaceDark = Color(0xFF141318);
  static const Color onSurfaceDark = Color(0xFFE5E1E9);
  static const Color surfaceVariantDark = Color(0xFF48454E);
  static const Color onSurfaceVariantDark = Color(0xFFCAC4CF);
  static const Color surfaceDimDark = Color(0xFF141318);
  static const Color surfaceBrightDark = Color(0xFF3A383E);
  static const Color surfaceContainerLowestDark = Color(0xFF0F0E13);
  static const Color surfaceContainerLowDark = Color(0xFF1C1B20);
  static const Color surfaceContainerDark = Color(0xFF201F24);
  static const Color surfaceContainerHighDark = Color(0xFF2B292F);
  static const Color surfaceContainerHighestDark = Color(0xFF36343A);

  // Inverse colors - Dark theme
  static const Color inverseSurfaceDark = Color(0xFFE5E1E9);
  static const Color onInverseSurfaceDark = Color(0xFF313035);
  static const Color inversePrimaryDark = Color(0xFF5B4FC4);

  // ============================================
  // COLOR SCHEMES
  // ============================================

  /// Light color scheme with WCAG compliant colors
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    surfaceContainerHighest: surfaceContainerHighest,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: shadow,
    scrim: scrim,
    inverseSurface: inverseSurface,
    onInverseSurface: onInverseSurface,
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );

  /// Dark color scheme with WCAG compliant colors
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryDark,
    onPrimary: onPrimaryDark,
    primaryContainer: primaryContainerDark,
    onPrimaryContainer: onPrimaryContainerDark,
    secondary: secondaryDark,
    onSecondary: onSecondaryDark,
    secondaryContainer: secondaryContainerDark,
    onSecondaryContainer: onSecondaryContainerDark,
    tertiary: tertiaryDark,
    onTertiary: onTertiaryDark,
    tertiaryContainer: tertiaryContainerDark,
    onTertiaryContainer: onTertiaryContainerDark,
    error: errorDark,
    onError: onErrorDark,
    errorContainer: errorContainerDark,
    onErrorContainer: onErrorContainerDark,
    surface: surfaceDark,
    onSurface: onSurfaceDark,
    surfaceContainerHighest: surfaceContainerHighestDark,
    onSurfaceVariant: onSurfaceVariantDark,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: shadow,
    scrim: scrim,
    inverseSurface: inverseSurfaceDark,
    onInverseSurface: onInverseSurfaceDark,
    inversePrimary: inversePrimaryDark,
    surfaceTint: primaryDark,
  );
}
