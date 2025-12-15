import 'package:flutter/material.dart';

/// Icon size constants.
///
/// Use these constants for consistent icon sizing throughout the app.
abstract final class AppIconSizes {
  /// Extra small icon (12dp) - badges, inline decorations
  static const double xs = 12;

  /// Small icon (16dp) - inline with text
  static const double sm = 16;

  /// Medium icon (20dp) - list items, buttons
  static const double md = 20;

  /// Standard icon (24dp) - most common use
  static const double standard = 24;

  /// Large icon (28dp) - emphasized elements
  static const double lg = 28;

  /// Extra large icon (32dp) - headers, feature icons
  static const double xl = 32;

  /// Huge icon (40dp) - empty states, prominent features
  static const double huge = 40;

  /// Extra huge icon (48dp) - main focal points
  static const double xhuge = 48;

  /// Massive icon (64dp) - splash, onboarding
  static const double massive = 64;

  /// Extra massive icon (80dp) - full page illustrations
  static const double xmassive = 80;

  // Semantic sizes
  /// AppBar icon size
  static const double appBar = standard;

  /// Bottom navigation icon size
  static const double bottomNav = standard;

  /// FAB icon size
  static const double fab = standard;

  /// Button icon size
  static const double button = 18;

  /// List tile leading icon size
  static const double listLeading = standard;

  /// List tile trailing icon size
  static const double listTrailing = standard;

  /// Tab bar icon size
  static const double tab = standard;

  /// Input field prefix/suffix icon size
  static const double input = standard;

  /// Chip icon size
  static const double chip = 18;

  /// Badge icon size
  static const double badge = sm;

  /// Empty state icon size
  static const double emptyState = huge;
}

/// Icon color utilities.
///
/// Provides semantic colors for icons based on context.
abstract final class AppIconColors {
  /// Get the primary icon color
  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  /// Get the secondary icon color
  static Color secondary(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;

  /// Get the default icon color (for most icons)
  static Color onSurface(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;

  /// Get the muted icon color (for less important icons)
  static Color onSurfaceVariant(BuildContext context) =>
      Theme.of(context).colorScheme.onSurfaceVariant;

  /// Get the disabled icon color
  static Color disabled(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38);

  /// Get the error icon color
  static Color error(BuildContext context) =>
      Theme.of(context).colorScheme.error;

  /// Get the success icon color
  static Color success(BuildContext context) => const Color(0xFF2E7D32);

  /// Get the warning icon color
  static Color warning(BuildContext context) => const Color(0xFFF57C00);

  /// Get the info icon color
  static Color info(BuildContext context) => const Color(0xFF1976D2);

  /// Get the inverse icon color (for dark surfaces)
  static Color inverse(BuildContext context) =>
      Theme.of(context).colorScheme.onInverseSurface;
}

/// A themed icon widget with consistent sizing and coloring.
class AppIcon extends StatelessWidget {
  /// The icon to display.
  final IconData icon;

  /// The icon size.
  final double? size;

  /// The icon color.
  final Color? color;

  /// Semantic color type (overrides color if set).
  final AppIconColorType? colorType;

  /// Optional semantic label for accessibility.
  final String? semanticLabel;

  const AppIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.colorType,
    this.semanticLabel,
  });

  /// Create a primary colored icon.
  const AppIcon.primary(this.icon, {super.key, this.size, this.semanticLabel})
    : color = null,
      colorType = AppIconColorType.primary;

  /// Create a muted icon.
  const AppIcon.muted(this.icon, {super.key, this.size, this.semanticLabel})
    : color = null,
      colorType = AppIconColorType.muted;

  /// Create an error icon.
  const AppIcon.error(this.icon, {super.key, this.size, this.semanticLabel})
    : color = null,
      colorType = AppIconColorType.error;

  /// Create a success icon.
  const AppIcon.success(this.icon, {super.key, this.size, this.semanticLabel})
    : color = null,
      colorType = AppIconColorType.success;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = _resolveColor(context);
    final effectiveSize = size ?? AppIconSizes.standard;

    return Icon(
      icon,
      size: effectiveSize,
      color: effectiveColor,
      semanticLabel: semanticLabel,
    );
  }

  Color? _resolveColor(BuildContext context) {
    if (colorType != null) {
      switch (colorType!) {
        case AppIconColorType.primary:
          return AppIconColors.primary(context);
        case AppIconColorType.secondary:
          return AppIconColors.secondary(context);
        case AppIconColorType.muted:
          return AppIconColors.onSurfaceVariant(context);
        case AppIconColorType.disabled:
          return AppIconColors.disabled(context);
        case AppIconColorType.error:
          return AppIconColors.error(context);
        case AppIconColorType.success:
          return AppIconColors.success(context);
        case AppIconColorType.warning:
          return AppIconColors.warning(context);
        case AppIconColorType.info:
          return AppIconColors.info(context);
      }
    }
    return color;
  }
}

/// Semantic icon color types.
enum AppIconColorType {
  /// Primary brand color
  primary,

  /// Secondary brand color
  secondary,

  /// Muted/variant color
  muted,

  /// Disabled color
  disabled,

  /// Error/danger color
  error,

  /// Success color
  success,

  /// Warning color
  warning,

  /// Info color
  info,
}

/// A circular icon container with background.
class AppIconBadge extends StatelessWidget {
  /// The icon to display.
  final IconData icon;

  /// The icon size.
  final double? iconSize;

  /// The container size.
  final double? size;

  /// The container color.
  final Color? backgroundColor;

  /// The icon color.
  final Color? iconColor;

  /// The container border radius (null for circle).
  final BorderRadius? borderRadius;

  const AppIconBadge({
    super.key,
    required this.icon,
    this.iconSize,
    this.size,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius,
  });

  /// Create a primary colored icon badge.
  factory AppIconBadge.primary({
    Key? key,
    required IconData icon,
    double? iconSize,
    double? size,
  }) {
    return _PrimaryIconBadge(
      key: key,
      icon: icon,
      iconSize: iconSize,
      size: size,
    );
  }

  /// Create a secondary colored icon badge.
  factory AppIconBadge.secondary({
    Key? key,
    required IconData icon,
    double? iconSize,
    double? size,
  }) {
    return _SecondaryIconBadge(
      key: key,
      icon: icon,
      iconSize: iconSize,
      size: size,
    );
  }

  /// Create a surface colored icon badge.
  factory AppIconBadge.surface({
    Key? key,
    required IconData icon,
    double? iconSize,
    double? size,
  }) {
    return _SurfaceIconBadge(
      key: key,
      icon: icon,
      iconSize: iconSize,
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveSize = size ?? 40;
    final effectiveIconSize = iconSize ?? AppIconSizes.md;

    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surfaceContainerHighest,
        borderRadius: borderRadius,
        shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: effectiveIconSize,
        color: iconColor ?? colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _PrimaryIconBadge extends AppIconBadge {
  const _PrimaryIconBadge({
    super.key,
    required super.icon,
    super.iconSize,
    super.size,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveSize = size ?? 40;
    final effectiveIconSize = iconSize ?? AppIconSizes.md;

    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: effectiveIconSize,
        color: colorScheme.onPrimaryContainer,
      ),
    );
  }
}

class _SecondaryIconBadge extends AppIconBadge {
  const _SecondaryIconBadge({
    super.key,
    required super.icon,
    super.iconSize,
    super.size,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveSize = size ?? 40;
    final effectiveIconSize = iconSize ?? AppIconSizes.md;

    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: effectiveIconSize,
        color: colorScheme.onSecondaryContainer,
      ),
    );
  }
}

class _SurfaceIconBadge extends AppIconBadge {
  const _SurfaceIconBadge({
    super.key,
    required super.icon,
    super.iconSize,
    super.size,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveSize = size ?? 40;
    final effectiveIconSize = iconSize ?? AppIconSizes.md;

    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: effectiveIconSize,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}

// ============================================
// ICON CONTAINER SIZES
// ============================================

/// Icon container size variants.
enum AppIconContainerSize {
  /// Small container (32dp)
  small,

  /// Medium container (40dp)
  medium,

  /// Large container (56dp)
  large,

  /// Extra large container (80dp)
  xl,
}

/// A flexible icon container with customizable background.
class AppIconContainer extends StatelessWidget {
  /// The icon to display.
  final IconData icon;

  /// The container size.
  final AppIconContainerSize size;

  /// The icon color.
  final Color? color;

  /// The background color.
  final Color? backgroundColor;

  /// The container shape.
  final BoxShape shape;

  /// Border radius (only used when shape is rectangle).
  final BorderRadius? borderRadius;

  const AppIconContainer({
    super.key,
    required this.icon,
    this.size = AppIconContainerSize.medium,
    this.color,
    this.backgroundColor,
    this.shape = BoxShape.circle,
    this.borderRadius,
  });

  static const Map<AppIconContainerSize, double> _containerSizes = {
    AppIconContainerSize.small: 32,
    AppIconContainerSize.medium: 40,
    AppIconContainerSize.large: 56,
    AppIconContainerSize.xl: 80,
  };

  static const Map<AppIconContainerSize, double> _iconSizes = {
    AppIconContainerSize.small: AppIconSizes.sm,
    AppIconContainerSize.medium: AppIconSizes.md,
    AppIconContainerSize.large: AppIconSizes.xl,
    AppIconContainerSize.xl: AppIconSizes.massive,
  };

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final containerSize = _containerSizes[size]!;
    final iconSize = _iconSizes[size]!;

    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surfaceContainerHighest,
        shape: shape,
        borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: iconSize,
        color: color ?? colorScheme.onSurfaceVariant,
      ),
    );
  }
}

// ============================================
// AVATAR SIZES
// ============================================

/// Avatar size variants.
enum AppAvatarSize {
  /// Extra small avatar (24dp)
  xs,

  /// Small avatar (32dp)
  small,

  /// Medium avatar (40dp)
  medium,

  /// Large avatar (56dp)
  large,

  /// Extra large avatar (80dp)
  xl,

  /// Extra extra large avatar (120dp)
  xxl,
}

/// A flexible avatar widget with image, initials, or placeholder.
class AppAvatar extends StatelessWidget {
  /// The avatar name (used for initials).
  final String? name;

  /// The image URL.
  final String? imageUrl;

  /// The avatar size.
  final AppAvatarSize size;

  /// Custom background color.
  final Color? backgroundColor;

  /// Custom foreground color.
  final Color? foregroundColor;

  /// Custom placeholder icon.
  final IconData? placeholderIcon;

  const AppAvatar({
    super.key,
    this.name,
    this.imageUrl,
    this.size = AppAvatarSize.medium,
    this.backgroundColor,
    this.foregroundColor,
    this.placeholderIcon,
  });

  static const Map<AppAvatarSize, double> _sizes = {
    AppAvatarSize.xs: 24,
    AppAvatarSize.small: 32,
    AppAvatarSize.medium: 40,
    AppAvatarSize.large: 56,
    AppAvatarSize.xl: 80,
    AppAvatarSize.xxl: 120,
  };

  static const Map<AppAvatarSize, double> _fontSizes = {
    AppAvatarSize.xs: 10,
    AppAvatarSize.small: 12,
    AppAvatarSize.medium: 14,
    AppAvatarSize.large: 20,
    AppAvatarSize.xl: 28,
    AppAvatarSize.xxl: 40,
  };

  static const Map<AppAvatarSize, double> _iconSizes = {
    AppAvatarSize.xs: 14,
    AppAvatarSize.small: 18,
    AppAvatarSize.medium: 22,
    AppAvatarSize.large: 30,
    AppAvatarSize.xl: 44,
    AppAvatarSize.xxl: 64,
  };

  String _getInitials() {
    if (name == null || name!.isEmpty) return '';

    final parts = name!.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';

    if (parts.length == 1) {
      return parts[0].substring(0, parts[0].length.clamp(0, 2)).toUpperCase();
    }

    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final avatarSize = _sizes[size]!;
    final fontSize = _fontSizes[size]!;
    final iconSize = _iconSizes[size]!;

    final bgColor = backgroundColor ?? colorScheme.primaryContainer;
    final fgColor = foregroundColor ?? colorScheme.onPrimaryContainer;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: avatarSize / 2,
        backgroundColor: bgColor,
        backgroundImage: NetworkImage(imageUrl!),
        onBackgroundImageError: (_, __) {},
      );
    }

    final initials = _getInitials();
    if (initials.isNotEmpty) {
      return CircleAvatar(
        radius: avatarSize / 2,
        backgroundColor: bgColor,
        child: Text(
          initials,
          style: TextStyle(
            color: fgColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return CircleAvatar(
      radius: avatarSize / 2,
      backgroundColor: bgColor,
      child: Icon(
        placeholderIcon ?? Icons.person,
        size: iconSize,
        color: fgColor,
      ),
    );
  }
}
