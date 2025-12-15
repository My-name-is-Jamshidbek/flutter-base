import 'package:flutter/material.dart';
import 'radii.dart';
import 'spacing.dart';
import 'elevation.dart';

/// Component theme builders.
///
/// These factories create consistent component themes
/// for both light and dark modes.
abstract final class AppComponentThemes {
  // ============================================
  // APP BAR THEMES
  // ============================================

  /// Default app bar theme
  static AppBarTheme appBarTheme({required ColorScheme colorScheme}) {
    return AppBarTheme(
      centerTitle: true,
      elevation: AppElevation.level0,
      scrolledUnderElevation: AppElevation.level1,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      surfaceTintColor: colorScheme.surfaceTint,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
      actionsIconTheme: IconThemeData(
        color: colorScheme.onSurfaceVariant,
        size: 24,
      ),
    );
  }

  // ============================================
  // CARD THEMES
  // ============================================

  /// Default card theme
  static CardThemeData cardTheme({required ColorScheme colorScheme}) {
    return CardThemeData(
      elevation: AppElevation.card,
      color: colorScheme.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      shadowColor: colorScheme.shadow.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.card),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
    );
  }

  /// Outlined card theme
  static CardThemeData outlinedCardTheme({required ColorScheme colorScheme}) {
    return CardThemeData(
      elevation: AppElevation.level0,
      color: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.card),
        side: BorderSide(color: colorScheme.outlineVariant, width: 1),
      ),
    );
  }

  // ============================================
  // BUTTON THEMES
  // ============================================

  /// Filled button theme
  static FilledButtonThemeData filledButtonTheme({
    required ColorScheme colorScheme,
  }) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(88, 48),
        padding: AppSpacing.buttonPadding,
        elevation: AppElevation.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.button),
        ),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  /// Outlined button theme
  static OutlinedButtonThemeData outlinedButtonTheme({
    required ColorScheme colorScheme,
  }) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(88, 48),
        padding: AppSpacing.buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.button),
        ),
        side: BorderSide(color: colorScheme.outline, width: 1),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  /// Text button theme
  static TextButtonThemeData textButtonTheme({
    required ColorScheme colorScheme,
  }) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(48, 40),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.button),
        ),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  /// Elevated button theme
  static ElevatedButtonThemeData elevatedButtonTheme({
    required ColorScheme colorScheme,
  }) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(88, 48),
        padding: AppSpacing.buttonPadding,
        elevation: AppElevation.level1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.button),
        ),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  /// Icon button theme
  static IconButtonThemeData iconButtonTheme({
    required ColorScheme colorScheme,
  }) {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.all(AppSpacing.sm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.circular),
        ),
      ),
    );
  }

  /// Floating action button theme
  static FloatingActionButtonThemeData fabTheme({
    required ColorScheme colorScheme,
  }) {
    return FloatingActionButtonThemeData(
      elevation: AppElevation.fab,
      focusElevation: AppElevation.fabPressed,
      hoverElevation: AppElevation.fabPressed,
      highlightElevation: AppElevation.fabPressed,
      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
    );
  }

  // ============================================
  // INPUT THEMES
  // ============================================

  /// Input decoration theme
  static InputDecorationTheme inputDecorationTheme({
    required ColorScheme colorScheme,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest,
      contentPadding: AppSpacing.inputPadding,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.input),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.input),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.input),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.input),
        borderSide: BorderSide(color: colorScheme.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.input),
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      errorStyle: TextStyle(color: colorScheme.error),
    );
  }

  // ============================================
  // CHIP THEMES
  // ============================================

  /// Chip theme
  static ChipThemeData chipTheme({required ColorScheme colorScheme}) {
    return ChipThemeData(
      elevation: AppElevation.chip,
      backgroundColor: colorScheme.surfaceContainerLow,
      selectedColor: colorScheme.secondaryContainer,
      disabledColor: colorScheme.onSurface.withValues(alpha: 0.12),
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 14),
      secondaryLabelStyle: TextStyle(
        color: colorScheme.onSecondaryContainer,
        fontSize: 14,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.chip),
      ),
      side: BorderSide(color: colorScheme.outline, width: 0.5),
    );
  }

  // ============================================
  // DIALOG THEMES
  // ============================================

  /// Dialog theme
  static DialogThemeData dialogTheme({required ColorScheme colorScheme}) {
    return DialogThemeData(
      elevation: AppElevation.dialog,
      backgroundColor: colorScheme.surfaceContainerHigh,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.dialog),
      ),
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }

  // ============================================
  // BOTTOM SHEET THEMES
  // ============================================

  /// Bottom sheet theme
  static BottomSheetThemeData bottomSheetTheme({
    required ColorScheme colorScheme,
  }) {
    return BottomSheetThemeData(
      elevation: AppElevation.bottomSheet,
      backgroundColor: colorScheme.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadii.borderRadiusTopHuge,
      ),
      showDragHandle: true,
      dragHandleColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
      dragHandleSize: const Size(32, 4),
    );
  }

  // ============================================
  // NAVIGATION THEMES
  // ============================================

  /// Navigation bar theme
  static NavigationBarThemeData navigationBarTheme({
    required ColorScheme colorScheme,
  }) {
    return NavigationBarThemeData(
      elevation: AppElevation.level0,
      backgroundColor: colorScheme.surfaceContainer,
      surfaceTintColor: Colors.transparent,
      indicatorColor: colorScheme.secondaryContainer,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      height: 80,
    );
  }

  /// Navigation rail theme
  static NavigationRailThemeData navigationRailTheme({
    required ColorScheme colorScheme,
  }) {
    return NavigationRailThemeData(
      elevation: AppElevation.level0,
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.secondaryContainer,
      selectedIconTheme: IconThemeData(color: colorScheme.onSecondaryContainer),
      unselectedIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
    );
  }

  /// Navigation drawer theme
  static NavigationDrawerThemeData navigationDrawerTheme({
    required ColorScheme colorScheme,
  }) {
    return NavigationDrawerThemeData(
      elevation: AppElevation.drawer,
      backgroundColor: colorScheme.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      indicatorColor: colorScheme.secondaryContainer,
    );
  }

  // ============================================
  // LIST THEMES
  // ============================================

  /// List tile theme
  static ListTileThemeData listTileTheme({required ColorScheme colorScheme}) {
    return ListTileThemeData(
      contentPadding: AppSpacing.listItemPadding,
      tileColor: Colors.transparent,
      selectedTileColor: colorScheme.secondaryContainer.withValues(alpha: 0.5),
      iconColor: colorScheme.onSurfaceVariant,
      textColor: colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
    );
  }

  // ============================================
  // DIVIDER THEMES
  // ============================================

  /// Divider theme
  static DividerThemeData dividerTheme({required ColorScheme colorScheme}) {
    return DividerThemeData(
      color: colorScheme.outlineVariant,
      thickness: 1,
      space: 1,
    );
  }

  // ============================================
  // SNACKBAR THEMES
  // ============================================

  /// Snackbar theme
  static SnackBarThemeData snackBarTheme({required ColorScheme colorScheme}) {
    return SnackBarThemeData(
      elevation: AppElevation.snackbar,
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: TextStyle(
        color: colorScheme.onInverseSurface,
        fontSize: 14,
      ),
      actionTextColor: colorScheme.inversePrimary,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.snackbar),
      ),
    );
  }

  // ============================================
  // SWITCH THEMES
  // ============================================

  /// Switch theme
  static SwitchThemeData switchTheme({required ColorScheme colorScheme}) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.onPrimary;
        }
        return colorScheme.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.surfaceContainerHighest;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.transparent;
        }
        return colorScheme.outline;
      }),
    );
  }

  // ============================================
  // CHECKBOX THEMES
  // ============================================

  /// Checkbox theme
  static CheckboxThemeData checkboxTheme({required ColorScheme colorScheme}) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
      side: BorderSide(color: colorScheme.outline, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    );
  }

  // ============================================
  // RADIO THEMES
  // ============================================

  /// Radio theme
  static RadioThemeData radioTheme({required ColorScheme colorScheme}) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.onSurfaceVariant;
      }),
    );
  }

  // ============================================
  // PROGRESS INDICATOR THEMES
  // ============================================

  /// Progress indicator theme
  static ProgressIndicatorThemeData progressIndicatorTheme({
    required ColorScheme colorScheme,
  }) {
    return ProgressIndicatorThemeData(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.surfaceContainerHighest,
      circularTrackColor: colorScheme.surfaceContainerHighest,
    );
  }

  // ============================================
  // SLIDER THEMES
  // ============================================

  /// Slider theme
  static SliderThemeData sliderTheme({required ColorScheme colorScheme}) {
    return SliderThemeData(
      activeTrackColor: colorScheme.primary,
      inactiveTrackColor: colorScheme.surfaceContainerHighest,
      thumbColor: colorScheme.primary,
      overlayColor: colorScheme.primary.withValues(alpha: 0.12),
      valueIndicatorColor: colorScheme.primary,
      valueIndicatorTextStyle: TextStyle(color: colorScheme.onPrimary),
    );
  }

  // ============================================
  // TAB BAR THEMES
  // ============================================

  /// Tab bar theme
  static TabBarThemeData tabBarTheme({required ColorScheme colorScheme}) {
    return TabBarThemeData(
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicatorColor: colorScheme.primary,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: colorScheme.outlineVariant,
    );
  }

  // ============================================
  // TOOLTIP THEMES
  // ============================================

  /// Tooltip theme
  static TooltipThemeData tooltipTheme({required ColorScheme colorScheme}) {
    return TooltipThemeData(
      decoration: BoxDecoration(
        color: colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(AppRadii.tooltip),
      ),
      textStyle: TextStyle(color: colorScheme.onInverseSurface, fontSize: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
    );
  }

  // ============================================
  // POPUP MENU THEMES
  // ============================================

  /// Popup menu theme
  static PopupMenuThemeData popupMenuTheme({required ColorScheme colorScheme}) {
    return PopupMenuThemeData(
      elevation: AppElevation.menu,
      color: colorScheme.surfaceContainer,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.xs),
      ),
    );
  }

  // ============================================
  // BADGE THEMES
  // ============================================

  /// Badge theme
  static BadgeThemeData badgeTheme({required ColorScheme colorScheme}) {
    return BadgeThemeData(
      backgroundColor: colorScheme.error,
      textColor: colorScheme.onError,
      textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
    );
  }

  // ============================================
  // SEGMENTED BUTTON THEMES
  // ============================================

  /// Segmented button theme
  static SegmentedButtonThemeData segmentedButtonTheme({
    required ColorScheme colorScheme,
  }) {
    return SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.secondaryContainer;
          }
          return Colors.transparent;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.onSecondaryContainer;
          }
          return colorScheme.onSurface;
        }),
        side: WidgetStateProperty.all(BorderSide(color: colorScheme.outline)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.button),
          ),
        ),
      ),
    );
  }
}
