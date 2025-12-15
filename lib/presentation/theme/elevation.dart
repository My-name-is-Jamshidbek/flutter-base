/// Elevation design tokens following Material Design 3.
///
/// Use these constants for consistent shadow/elevation throughout the app.
abstract final class AppElevation {
  /// Level 0 - No elevation (flat surfaces)
  static const double level0 = 0.0;

  /// Level 1 - Minimal elevation (cards at rest, switches)
  static const double level1 = 1.0;

  /// Level 2 - Low elevation (cards on hover, FAB at rest)
  static const double level2 = 3.0;

  /// Level 3 - Medium elevation (FAB pressed, navigation drawer)
  static const double level3 = 6.0;

  /// Level 4 - High elevation (dialogs, modal sheets)
  static const double level4 = 8.0;

  /// Level 5 - Highest elevation (navigation rail)
  static const double level5 = 12.0;

  // Semantic elevation aliases

  /// Card elevation at rest
  static const double card = level1;

  /// Card elevation on hover/focus
  static const double cardHovered = level2;

  /// Floating action button at rest
  static const double fab = level2;

  /// Floating action button pressed
  static const double fabPressed = level3;

  /// App bar elevation (scrolled under)
  static const double appBar = level1;

  /// Navigation drawer elevation
  static const double drawer = level3;

  /// Bottom sheet elevation
  static const double bottomSheet = level3;

  /// Dialog elevation
  static const double dialog = level4;

  /// Modal bottom sheet elevation
  static const double modalBottomSheet = level4;

  /// Menu elevation
  static const double menu = level2;

  /// Dropdown elevation
  static const double dropdown = level2;

  /// Snackbar elevation
  static const double snackbar = level3;

  /// Tooltip elevation
  static const double tooltip = level1;

  /// Switch/Slider thumb elevation
  static const double thumb = level1;

  /// Chip elevation
  static const double chip = level1;

  /// Button elevation at rest
  static const double button = level0;

  /// Button elevation pressed
  static const double buttonPressed = level1;

  /// Search bar elevation
  static const double searchBar = level2;

  /// Banner elevation
  static const double banner = level1;
}
