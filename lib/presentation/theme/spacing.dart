import 'package:flutter/material.dart';

/// Spacing design tokens following 4-point grid system.
///
/// Use these constants for consistent spacing throughout the app.
/// Based on Material Design spacing principles.
abstract final class AppSpacing {
  // Base unit (4dp)
  static const double unit = 4.0;

  /// 0dp - No spacing
  static const double none = 0.0;

  /// 2dp - Minimal spacing (icons, inline elements)
  static const double xxs = 2.0;

  /// 4dp - Extra extra small
  static const double xs = 4.0;

  /// 8dp - Extra small
  static const double sm = 8.0;

  /// 12dp - Small-medium
  static const double md = 12.0;

  /// 16dp - Medium (default padding)
  static const double lg = 16.0;

  /// 20dp - Large
  static const double xl = 20.0;

  /// 24dp - Extra large
  static const double xxl = 24.0;

  /// 32dp - Extra extra large
  static const double xxxl = 32.0;

  /// 40dp - Huge
  static const double huge = 40.0;

  /// 48dp - Extra huge
  static const double xhuge = 48.0;

  /// 56dp - Massive
  static const double massive = 56.0;

  /// 64dp - Extra massive
  static const double xmassive = 64.0;

  // Semantic spacing aliases
  /// Default page padding (16dp)
  static const double pagePadding = lg;

  /// Default card padding (16dp)
  static const double cardPadding = lg;

  /// Default list item padding (16dp horizontal, 12dp vertical)
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  /// Default section spacing (24dp)
  static const double sectionSpacing = xxl;

  /// Default button padding
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  /// Default input field padding
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  /// Default dialog padding
  static const EdgeInsets dialogPadding = EdgeInsets.all(xxl);

  /// Default bottom sheet padding
  static const EdgeInsets bottomSheetPadding = EdgeInsets.fromLTRB(
    lg,
    md,
    lg,
    xxl,
  );

  /// Page edge insets (horizontal padding)
  static const EdgeInsets pageEdgeInsets = EdgeInsets.symmetric(
    horizontal: pagePadding,
  );

  /// Card content insets
  static const EdgeInsets cardContentInsets = EdgeInsets.all(cardPadding);

  /// AppBar content padding
  static const EdgeInsets appBarPadding = EdgeInsets.symmetric(horizontal: xs);

  // Gap widgets for use in Row/Column
  /// Horizontal gap - extra small (4dp)
  static const SizedBox horizontalGapXs = SizedBox(width: xs);

  /// Horizontal gap - small (8dp)
  static const SizedBox horizontalGapSm = SizedBox(width: sm);

  /// Horizontal gap - medium (12dp)
  static const SizedBox horizontalGapMd = SizedBox(width: md);

  /// Horizontal gap - large (16dp)
  static const SizedBox horizontalGapLg = SizedBox(width: lg);

  /// Horizontal gap - extra large (24dp)
  static const SizedBox horizontalGapXl = SizedBox(width: xxl);

  /// Vertical gap - extra small (4dp)
  static const SizedBox verticalGapXs = SizedBox(height: xs);

  /// Vertical gap - small (8dp)
  static const SizedBox verticalGapSm = SizedBox(height: sm);

  /// Vertical gap - medium (12dp)
  static const SizedBox verticalGapMd = SizedBox(height: md);

  /// Vertical gap - large (16dp)
  static const SizedBox verticalGapLg = SizedBox(height: lg);

  /// Vertical gap - extra large (24dp)
  static const SizedBox verticalGapXl = SizedBox(height: xxl);

  /// Vertical gap - section spacing (32dp)
  static const SizedBox verticalGapSection = SizedBox(height: xxxl);
}
