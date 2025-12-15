import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'components.dart';

/// Application theme configuration.
///
/// Provides factory methods for building light and dark themes
/// with WCAG-compliant colors and Material Design 3 components.
abstract final class AppTheme {
  // ============================================
  // THEME GETTERS (Convenience)
  // ============================================

  /// Light theme configuration.
  static ThemeData get light => buildLightTheme();

  /// Dark theme configuration.
  static ThemeData get dark => buildDarkTheme();

  // ============================================
  // THEME FACTORY METHODS
  // ============================================

  /// Build the light theme.
  ///
  /// Uses WCAG AA compliant colors and Material Design 3 components.
  /// Optionally accepts a custom [colorScheme] to override default colors.
  static ThemeData buildLightTheme({
    ColorScheme? colorScheme,
    TextTheme? textTheme,
  }) {
    final scheme = colorScheme ?? AppColors.lightColorScheme;
    final text = textTheme ?? AppTypography.textTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme,
      textTheme: text.apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),

      // Visual density
      visualDensity: VisualDensity.standard,

      // Splash factory
      splashFactory: InkSparkle.splashFactory,

      // App bar
      appBarTheme: AppComponentThemes.appBarTheme(colorScheme: scheme),

      // Cards
      cardTheme: AppComponentThemes.cardTheme(colorScheme: scheme),

      // Buttons
      filledButtonTheme: AppComponentThemes.filledButtonTheme(
        colorScheme: scheme,
      ),
      outlinedButtonTheme: AppComponentThemes.outlinedButtonTheme(
        colorScheme: scheme,
      ),
      textButtonTheme: AppComponentThemes.textButtonTheme(colorScheme: scheme),
      elevatedButtonTheme: AppComponentThemes.elevatedButtonTheme(
        colorScheme: scheme,
      ),
      iconButtonTheme: AppComponentThemes.iconButtonTheme(colorScheme: scheme),
      floatingActionButtonTheme: AppComponentThemes.fabTheme(
        colorScheme: scheme,
      ),

      // Inputs
      inputDecorationTheme: AppComponentThemes.inputDecorationTheme(
        colorScheme: scheme,
      ),

      // Chips
      chipTheme: AppComponentThemes.chipTheme(colorScheme: scheme),

      // Dialogs
      dialogTheme: AppComponentThemes.dialogTheme(colorScheme: scheme),

      // Bottom sheets
      bottomSheetTheme: AppComponentThemes.bottomSheetTheme(
        colorScheme: scheme,
      ),

      // Navigation
      navigationBarTheme: AppComponentThemes.navigationBarTheme(
        colorScheme: scheme,
      ),
      navigationRailTheme: AppComponentThemes.navigationRailTheme(
        colorScheme: scheme,
      ),
      navigationDrawerTheme: AppComponentThemes.navigationDrawerTheme(
        colorScheme: scheme,
      ),

      // Lists
      listTileTheme: AppComponentThemes.listTileTheme(colorScheme: scheme),

      // Dividers
      dividerTheme: AppComponentThemes.dividerTheme(colorScheme: scheme),

      // Snackbar
      snackBarTheme: AppComponentThemes.snackBarTheme(colorScheme: scheme),

      // Switches & Checkboxes
      switchTheme: AppComponentThemes.switchTheme(colorScheme: scheme),
      checkboxTheme: AppComponentThemes.checkboxTheme(colorScheme: scheme),
      radioTheme: AppComponentThemes.radioTheme(colorScheme: scheme),

      // Progress indicators
      progressIndicatorTheme: AppComponentThemes.progressIndicatorTheme(
        colorScheme: scheme,
      ),

      // Sliders
      sliderTheme: AppComponentThemes.sliderTheme(colorScheme: scheme),

      // Tabs
      tabBarTheme: AppComponentThemes.tabBarTheme(colorScheme: scheme),

      // Tooltips
      tooltipTheme: AppComponentThemes.tooltipTheme(colorScheme: scheme),

      // Popup menus
      popupMenuTheme: AppComponentThemes.popupMenuTheme(colorScheme: scheme),

      // Badges
      badgeTheme: AppComponentThemes.badgeTheme(colorScheme: scheme),

      // Segmented buttons
      segmentedButtonTheme: AppComponentThemes.segmentedButtonTheme(
        colorScheme: scheme,
      ),

      // Page transitions
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        },
      ),

      // Scrollbar
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(
          scheme.onSurface.withValues(alpha: 0.3),
        ),
        thickness: WidgetStateProperty.all(4),
        radius: const Radius.circular(2),
      ),

      // Extensions (optional custom theme extensions)
      extensions: const <ThemeExtension<dynamic>>[],
    );
  }

  /// Build the dark theme.
  ///
  /// Uses WCAG AA compliant colors and Material Design 3 components.
  /// Optionally accepts a custom [colorScheme] to override default colors.
  static ThemeData buildDarkTheme({
    ColorScheme? colorScheme,
    TextTheme? textTheme,
  }) {
    final scheme = colorScheme ?? AppColors.darkColorScheme;
    final text = textTheme ?? AppTypography.textTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      textTheme: text.apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),

      // Visual density
      visualDensity: VisualDensity.standard,

      // Splash factory
      splashFactory: InkSparkle.splashFactory,

      // App bar
      appBarTheme: AppComponentThemes.appBarTheme(colorScheme: scheme),

      // Cards
      cardTheme: AppComponentThemes.cardTheme(colorScheme: scheme),

      // Buttons
      filledButtonTheme: AppComponentThemes.filledButtonTheme(
        colorScheme: scheme,
      ),
      outlinedButtonTheme: AppComponentThemes.outlinedButtonTheme(
        colorScheme: scheme,
      ),
      textButtonTheme: AppComponentThemes.textButtonTheme(colorScheme: scheme),
      elevatedButtonTheme: AppComponentThemes.elevatedButtonTheme(
        colorScheme: scheme,
      ),
      iconButtonTheme: AppComponentThemes.iconButtonTheme(colorScheme: scheme),
      floatingActionButtonTheme: AppComponentThemes.fabTheme(
        colorScheme: scheme,
      ),

      // Inputs
      inputDecorationTheme: AppComponentThemes.inputDecorationTheme(
        colorScheme: scheme,
      ),

      // Chips
      chipTheme: AppComponentThemes.chipTheme(colorScheme: scheme),

      // Dialogs
      dialogTheme: AppComponentThemes.dialogTheme(colorScheme: scheme),

      // Bottom sheets
      bottomSheetTheme: AppComponentThemes.bottomSheetTheme(
        colorScheme: scheme,
      ),

      // Navigation
      navigationBarTheme: AppComponentThemes.navigationBarTheme(
        colorScheme: scheme,
      ),
      navigationRailTheme: AppComponentThemes.navigationRailTheme(
        colorScheme: scheme,
      ),
      navigationDrawerTheme: AppComponentThemes.navigationDrawerTheme(
        colorScheme: scheme,
      ),

      // Lists
      listTileTheme: AppComponentThemes.listTileTheme(colorScheme: scheme),

      // Dividers
      dividerTheme: AppComponentThemes.dividerTheme(colorScheme: scheme),

      // Snackbar
      snackBarTheme: AppComponentThemes.snackBarTheme(colorScheme: scheme),

      // Switches & Checkboxes
      switchTheme: AppComponentThemes.switchTheme(colorScheme: scheme),
      checkboxTheme: AppComponentThemes.checkboxTheme(colorScheme: scheme),
      radioTheme: AppComponentThemes.radioTheme(colorScheme: scheme),

      // Progress indicators
      progressIndicatorTheme: AppComponentThemes.progressIndicatorTheme(
        colorScheme: scheme,
      ),

      // Sliders
      sliderTheme: AppComponentThemes.sliderTheme(colorScheme: scheme),

      // Tabs
      tabBarTheme: AppComponentThemes.tabBarTheme(colorScheme: scheme),

      // Tooltips
      tooltipTheme: AppComponentThemes.tooltipTheme(colorScheme: scheme),

      // Popup menus
      popupMenuTheme: AppComponentThemes.popupMenuTheme(colorScheme: scheme),

      // Badges
      badgeTheme: AppComponentThemes.badgeTheme(colorScheme: scheme),

      // Segmented buttons
      segmentedButtonTheme: AppComponentThemes.segmentedButtonTheme(
        colorScheme: scheme,
      ),

      // Page transitions
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        },
      ),

      // Scrollbar
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(
          scheme.onSurface.withValues(alpha: 0.3),
        ),
        thickness: WidgetStateProperty.all(4),
        radius: const Radius.circular(2),
      ),

      // Extensions (optional custom theme extensions)
      extensions: const <ThemeExtension<dynamic>>[],
    );
  }

  // ============================================
  // SYSTEM UI OVERLAY STYLES
  // ============================================

  /// System UI overlay style for light theme.
  static const SystemUiOverlayStyle lightSystemUiOverlayStyle =
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      );

  /// System UI overlay style for dark theme.
  static const SystemUiOverlayStyle darkSystemUiOverlayStyle =
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
      );

  /// Get the appropriate system UI overlay style for the given brightness.
  static SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness brightness) {
    return brightness == Brightness.light
        ? lightSystemUiOverlayStyle
        : darkSystemUiOverlayStyle;
  }

  // ============================================
  // THEME HELPERS
  // ============================================

  /// Creates a theme with a custom primary color.
  ///
  /// Useful for dynamic theming or branding customization.
  static ThemeData withPrimaryColor(
    Color primaryColor, {
    required Brightness brightness,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: brightness,
    );

    return brightness == Brightness.light
        ? buildLightTheme(colorScheme: colorScheme)
        : buildDarkTheme(colorScheme: colorScheme);
  }

  /// Creates a theme from a seed color.
  ///
  /// The Material 3 color system will generate a complete
  /// color palette from the seed color.
  static ThemeData fromSeed(Color seedColor, {required Brightness brightness}) {
    return withPrimaryColor(seedColor, brightness: brightness);
  }
}
