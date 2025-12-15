import 'package:flutter/material.dart';

/// Border radius design tokens.
///
/// Use these constants for consistent corner radii throughout the app.
abstract final class AppRadii {
  /// 0dp - No radius (sharp corners)
  static const double none = 0.0;

  /// 4dp - Extra small radius
  static const double xs = 4.0;

  /// 8dp - Small radius (chips, small buttons)
  static const double sm = 8.0;

  /// 12dp - Medium radius (cards, dialogs)
  static const double md = 12.0;

  /// 16dp - Large radius (sheets, modals)
  static const double lg = 16.0;

  /// 20dp - Extra large radius
  static const double xl = 20.0;

  /// 24dp - Extra extra large radius
  static const double xxl = 24.0;

  /// 28dp - Huge radius (full-screen sheets)
  static const double huge = 28.0;

  /// Circular/Pill shape (use with constraints)
  static const double circular = 999.0;

  // Semantic radius aliases

  /// Default button radius (12dp)
  static const double button = md;

  /// Default card radius (12dp)
  static const double card = md;

  /// Default chip radius (8dp)
  static const double chip = sm;

  /// Default input field radius (12dp)
  static const double input = md;

  /// Default dialog radius (28dp)
  static const double dialog = huge;

  /// Default bottom sheet radius (28dp)
  static const double bottomSheet = huge;

  /// Default snackbar radius (4dp)
  static const double snackbar = xs;

  /// Default tooltip radius (4dp)
  static const double tooltip = xs;

  /// Default avatar radius (circular)
  static const double avatar = circular;

  // BorderRadius constants for direct use

  /// BorderRadius - None (0dp)
  static const BorderRadius borderRadiusNone = BorderRadius.zero;

  /// BorderRadius - Extra small (4dp)
  static const BorderRadius borderRadiusXs = BorderRadius.all(
    Radius.circular(xs),
  );

  /// BorderRadius - Small (8dp)
  static const BorderRadius borderRadiusSm = BorderRadius.all(
    Radius.circular(sm),
  );

  /// BorderRadius - Medium (12dp)
  static const BorderRadius borderRadiusMd = BorderRadius.all(
    Radius.circular(md),
  );

  /// BorderRadius - Large (16dp)
  static const BorderRadius borderRadiusLg = BorderRadius.all(
    Radius.circular(lg),
  );

  /// BorderRadius - Extra large (24dp)
  static const BorderRadius borderRadiusXl = BorderRadius.all(
    Radius.circular(xxl),
  );

  /// BorderRadius - Huge (28dp)
  static const BorderRadius borderRadiusHuge = BorderRadius.all(
    Radius.circular(huge),
  );

  /// BorderRadius - Circular
  static const BorderRadius borderRadiusCircular = BorderRadius.all(
    Radius.circular(circular),
  );

  /// BorderRadius - Top only medium (for bottom sheets)
  static const BorderRadius borderRadiusTopMd = BorderRadius.only(
    topLeft: Radius.circular(md),
    topRight: Radius.circular(md),
  );

  /// BorderRadius - Top only large (for bottom sheets)
  static const BorderRadius borderRadiusTopLg = BorderRadius.only(
    topLeft: Radius.circular(lg),
    topRight: Radius.circular(lg),
  );

  /// BorderRadius - Top only huge (for bottom sheets)
  static const BorderRadius borderRadiusTopHuge = BorderRadius.only(
    topLeft: Radius.circular(huge),
    topRight: Radius.circular(huge),
  );
}
