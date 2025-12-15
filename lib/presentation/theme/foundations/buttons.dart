import 'package:flutter/material.dart';
import '../radii.dart';
import '../spacing.dart';

/// Button size variants.
enum AppButtonSize {
  /// Small button (height: 36)
  small,

  /// Medium button (height: 44)
  medium,

  /// Large button (height: 52)
  large,
}

/// Button style utilities.
///
/// Provides consistent button sizes and helper methods
/// for creating styled buttons throughout the app.
abstract final class AppButtonStyles {
  // ============================================
  // SIZE CONSTANTS
  // ============================================

  /// Button heights by size
  static const Map<AppButtonSize, double> heights = {
    AppButtonSize.small: 36,
    AppButtonSize.medium: 44,
    AppButtonSize.large: 52,
  };

  /// Button minimum widths by size
  static const Map<AppButtonSize, double> minWidths = {
    AppButtonSize.small: 64,
    AppButtonSize.medium: 88,
    AppButtonSize.large: 120,
  };

  /// Button padding by size
  static const Map<AppButtonSize, EdgeInsets> paddings = {
    AppButtonSize.small: EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.xs,
    ),
    AppButtonSize.medium: EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.sm,
    ),
    AppButtonSize.large: EdgeInsets.symmetric(
      horizontal: AppSpacing.xl,
      vertical: AppSpacing.md,
    ),
  };

  /// Button text sizes by size
  static const Map<AppButtonSize, double> textSizes = {
    AppButtonSize.small: 12,
    AppButtonSize.medium: 14,
    AppButtonSize.large: 16,
  };

  /// Button icon sizes by size
  static const Map<AppButtonSize, double> iconSizes = {
    AppButtonSize.small: 16,
    AppButtonSize.medium: 18,
    AppButtonSize.large: 20,
  };

  // ============================================
  // STYLE BUILDERS
  // ============================================

  /// Get ButtonStyle for a specific size
  static ButtonStyle sizeStyle(AppButtonSize size) {
    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(
        Size(minWidths[size]!, heights[size]!),
      ),
      padding: WidgetStateProperty.all(paddings[size]),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: textSizes[size],
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  /// Filled button style for a specific size
  static ButtonStyle filledStyle(AppButtonSize size) {
    return sizeStyle(size).copyWith(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.button),
        ),
      ),
    );
  }

  /// Outlined button style for a specific size
  static ButtonStyle outlinedStyle(
    AppButtonSize size,
    ColorScheme colorScheme,
  ) {
    return sizeStyle(size).copyWith(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.button),
        ),
      ),
      side: WidgetStateProperty.all(BorderSide(color: colorScheme.outline)),
    );
  }

  /// Text button style for a specific size
  static ButtonStyle textStyle(AppButtonSize size) {
    return sizeStyle(size);
  }
}

// ============================================
// BUTTON WRAPPER WIDGETS
// ============================================

/// A filled button with size variants.
class AppFilledButton extends StatelessWidget {
  /// The button label.
  final String label;

  /// Called when the button is pressed.
  final VoidCallback? onPressed;

  /// The button size.
  final AppButtonSize size;

  /// Optional leading icon.
  final IconData? icon;

  /// Whether the button is in loading state.
  final bool isLoading;

  /// Whether the button expands to fill available width.
  final bool expanded;

  const AppFilledButton({
    super.key,
    required this.label,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final child = _buildChild(context);
    final style = AppButtonStyles.filledStyle(size);

    Widget button;
    if (icon != null && !isLoading) {
      button = FilledButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: Icon(icon, size: AppButtonStyles.iconSizes[size]),
        label: child,
        style: style,
      );
    } else {
      button = FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: style,
        child: child,
      );
    }

    if (expanded) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: AppButtonStyles.iconSizes[size],
        height: AppButtonStyles.iconSizes[size],
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      );
    }
    return Text(label);
  }
}

/// An outlined button with size variants.
class AppOutlinedButton extends StatelessWidget {
  /// The button label.
  final String label;

  /// Called when the button is pressed.
  final VoidCallback? onPressed;

  /// The button size.
  final AppButtonSize size;

  /// Optional leading icon.
  final IconData? icon;

  /// Whether the button is in loading state.
  final bool isLoading;

  /// Whether the button expands to fill available width.
  final bool expanded;

  const AppOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final child = _buildChild(context);
    final style = AppButtonStyles.outlinedStyle(size, colorScheme);

    Widget button;
    if (icon != null && !isLoading) {
      button = OutlinedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: Icon(icon, size: AppButtonStyles.iconSizes[size]),
        label: child,
        style: style,
      );
    } else {
      button = OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: style,
        child: child,
      );
    }

    if (expanded) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: AppButtonStyles.iconSizes[size],
        height: AppButtonStyles.iconSizes[size],
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }
    return Text(label);
  }
}

/// A text button with size variants.
class AppTextButton extends StatelessWidget {
  /// The button label.
  final String label;

  /// Called when the button is pressed.
  final VoidCallback? onPressed;

  /// The button size.
  final AppButtonSize size;

  /// Optional leading icon.
  final IconData? icon;

  /// Whether the button is in loading state.
  final bool isLoading;

  const AppTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final child = _buildChild(context);
    final style = AppButtonStyles.textStyle(size);

    if (icon != null && !isLoading) {
      return TextButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: Icon(icon, size: AppButtonStyles.iconSizes[size]),
        label: child,
        style: style,
      );
    }
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: child,
    );
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: AppButtonStyles.iconSizes[size],
        height: AppButtonStyles.iconSizes[size],
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }
    return Text(label);
  }
}

/// An elevated button with size variants.
class AppElevatedButton extends StatelessWidget {
  /// The button label.
  final String label;

  /// Called when the button is pressed.
  final VoidCallback? onPressed;

  /// The button size.
  final AppButtonSize size;

  /// Optional leading icon.
  final IconData? icon;

  /// Whether the button is in loading state.
  final bool isLoading;

  /// Whether the button expands to fill available width.
  final bool expanded;

  const AppElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final child = _buildChild(context);
    final style = AppButtonStyles.sizeStyle(size);

    Widget button;
    if (icon != null && !isLoading) {
      button = ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: Icon(icon, size: AppButtonStyles.iconSizes[size]),
        label: child,
        style: style,
      );
    } else {
      button = ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: style,
        child: child,
      );
    }

    if (expanded) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: AppButtonStyles.iconSizes[size],
        height: AppButtonStyles.iconSizes[size],
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }
    return Text(label);
  }
}
