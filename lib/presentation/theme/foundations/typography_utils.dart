import 'package:flutter/material.dart';

/// Extended typography utilities.
///
/// Provides additional text styles and extensions beyond the base TextTheme.
/// Use these for captions, hints, and specialized text styling.
abstract final class AppTextStyles {
  // ============================================
  // UTILITY STYLES
  // ============================================

  /// Caption text style (used for timestamps, metadata)
  static TextStyle caption(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      fontSize: 12,
      letterSpacing: 0.4,
    );
  }

  /// Hint text style (used for placeholder text)
  static TextStyle hint(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
    );
  }

  /// Overline text style (small uppercase labels)
  static TextStyle overline(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.labelSmall!.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w500,
    );
  }

  /// Error text style
  static TextStyle error(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.error,
      fontSize: 12,
    );
  }

  /// Success text style
  static TextStyle success(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodySmall!.copyWith(
      color: const Color(0xFF2E7D32), // Green
      fontSize: 12,
    );
  }

  /// Link text style
  static TextStyle link(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.primary,
      decoration: TextDecoration.underline,
      decorationColor: theme.colorScheme.primary,
    );
  }

  /// Monospace text style (for code, numbers)
  static TextStyle monospace(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      fontFamily: 'monospace',
      fontFamilyFallback: const ['Courier', 'Courier New'],
    );
  }

  /// Section header text style
  static TextStyle sectionHeader(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.labelMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
    );
  }

  /// Card title text style
  static TextStyle cardTitle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600);
  }

  /// Card subtitle text style
  static TextStyle cardSubtitle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
  }

  // ============================================
  // WEIGHT MODIFIERS
  // ============================================

  /// Apply light weight
  static TextStyle light(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w300);

  /// Apply regular weight
  static TextStyle regular(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w400);

  /// Apply medium weight
  static TextStyle medium(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w500);

  /// Apply semi-bold weight
  static TextStyle semiBold(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w600);

  /// Apply bold weight
  static TextStyle bold(TextStyle style) =>
      style.copyWith(fontWeight: FontWeight.w700);
}

/// Extension on TextStyle for convenient chaining.
extension TextStyleExtensions on TextStyle {
  /// Apply light weight
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Apply regular weight
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Apply medium weight
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Apply semi-bold weight
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Apply bold weight
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Apply italic
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Apply underline decoration
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  /// Apply strikethrough decoration
  TextStyle get strikethrough =>
      copyWith(decoration: TextDecoration.lineThrough);

  /// Set custom color
  TextStyle withColor(Color color) => copyWith(color: color);

  /// Set custom size
  TextStyle withSize(double size) => copyWith(fontSize: size);

  /// Set custom letter spacing
  TextStyle withLetterSpacing(double spacing) =>
      copyWith(letterSpacing: spacing);

  /// Set custom line height
  TextStyle withHeight(double height) => copyWith(height: height);
}

/// Extension on BuildContext for easy text style access.
extension TextThemeExtensions on BuildContext {
  /// Get the current text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get display large style
  TextStyle get displayLarge => textTheme.displayLarge!;

  /// Get display medium style
  TextStyle get displayMedium => textTheme.displayMedium!;

  /// Get display small style
  TextStyle get displaySmall => textTheme.displaySmall!;

  /// Get headline large style
  TextStyle get headlineLarge => textTheme.headlineLarge!;

  /// Get headline medium style
  TextStyle get headlineMedium => textTheme.headlineMedium!;

  /// Get headline small style
  TextStyle get headlineSmall => textTheme.headlineSmall!;

  /// Get title large style
  TextStyle get titleLarge => textTheme.titleLarge!;

  /// Get title medium style
  TextStyle get titleMedium => textTheme.titleMedium!;

  /// Get title small style
  TextStyle get titleSmall => textTheme.titleSmall!;

  /// Get body large style
  TextStyle get bodyLarge => textTheme.bodyLarge!;

  /// Get body medium style
  TextStyle get bodyMedium => textTheme.bodyMedium!;

  /// Get body small style
  TextStyle get bodySmall => textTheme.bodySmall!;

  /// Get label large style
  TextStyle get labelLarge => textTheme.labelLarge!;

  /// Get label medium style
  TextStyle get labelMedium => textTheme.labelMedium!;

  /// Get label small style
  TextStyle get labelSmall => textTheme.labelSmall!;
}
