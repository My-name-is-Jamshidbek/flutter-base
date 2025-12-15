import 'package:flutter/material.dart';
import '../spacing.dart';
import '../radii.dart';
import '../elevation.dart';

/// Surface style utilities.
///
/// Provides consistent styling for cards, containers, and list items
/// following the design system's elevation and spacing rules.
abstract final class AppSurfaces {
  // ============================================
  // CARD PADDING PRESETS
  // ============================================

  /// Compact card padding
  static const EdgeInsets cardPaddingCompact = EdgeInsets.all(AppSpacing.sm);

  /// Standard card padding
  static const EdgeInsets cardPaddingStandard = EdgeInsets.all(AppSpacing.lg);

  /// Comfortable card padding
  static const EdgeInsets cardPaddingComfortable = EdgeInsets.all(
    AppSpacing.xl,
  );

  /// Large card padding
  static const EdgeInsets cardPaddingLarge = EdgeInsets.all(AppSpacing.xxl);

  // ============================================
  // CARD ELEVATION PRESETS
  // ============================================

  /// Flat card (no elevation)
  static const double cardElevationFlat = AppElevation.level0;

  /// Low card elevation
  static const double cardElevationLow = AppElevation.level1;

  /// Standard card elevation
  static const double cardElevationStandard = AppElevation.card;

  /// Raised card elevation
  static const double cardElevationRaised = AppElevation.level3;

  // ============================================
  // DIVIDER CONSTANTS
  // ============================================

  /// Thin divider thickness
  static const double dividerThin = 0.5;

  /// Standard divider thickness
  static const double dividerStandard = 1.0;

  /// Thick divider thickness
  static const double dividerThick = 2.0;

  /// Section divider thickness
  static const double dividerSection = 8.0;
}

/// A styled card with consistent design tokens.
class AppCard extends StatelessWidget {
  /// Card child content.
  final Widget child;

  /// Card padding.
  final EdgeInsets? padding;

  /// Card margin.
  final EdgeInsets? margin;

  /// Card elevation.
  final double? elevation;

  /// Card border radius.
  final BorderRadius? borderRadius;

  /// Card background color.
  final Color? color;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Called when the card is long-pressed.
  final VoidCallback? onLongPress;

  /// Whether to show an outline instead of elevation.
  final bool outlined;

  /// Clip behavior.
  final Clip clipBehavior;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
    this.borderRadius,
    this.color,
    this.onTap,
    this.onLongPress,
    this.outlined = false,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveRadius = borderRadius ?? AppRadii.borderRadiusMd;
    final effectivePadding = padding ?? AppSurfaces.cardPaddingStandard;
    final effectiveMargin = margin;
    final effectiveElevation = outlined
        ? 0.0
        : (elevation ?? AppSurfaces.cardElevationStandard);

    Widget card = Card(
      elevation: effectiveElevation,
      margin: effectiveMargin,
      color: color ?? colorScheme.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      clipBehavior: clipBehavior,
      shape: RoundedRectangleBorder(
        borderRadius: effectiveRadius,
        side: outlined
            ? BorderSide(color: colorScheme.outlineVariant)
            : BorderSide.none,
      ),
      child: Padding(padding: effectivePadding, child: child),
    );

    if (onTap != null || onLongPress != null) {
      card = Card(
        elevation: effectiveElevation,
        margin: effectiveMargin,
        color: color ?? colorScheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        clipBehavior: clipBehavior,
        shape: RoundedRectangleBorder(
          borderRadius: effectiveRadius,
          side: outlined
              ? BorderSide(color: colorScheme.outlineVariant)
              : BorderSide.none,
        ),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: effectiveRadius,
          child: Padding(padding: effectivePadding, child: child),
        ),
      );
    }

    return card;
  }
}

/// A section container with optional header.
class AppSection extends StatelessWidget {
  /// Section title.
  final String? title;

  /// Section children.
  final List<Widget> children;

  /// Padding around the section content.
  final EdgeInsets? padding;

  /// Spacing between children.
  final double spacing;

  /// Whether to show dividers between children.
  final bool showDividers;

  /// Optional trailing widget for the header.
  final Widget? headerTrailing;

  /// Optional leading icon for the header.
  final IconData? headerIcon;

  const AppSection({
    super.key,
    this.title,
    required this.children,
    this.padding,
    this.spacing = AppSpacing.sm,
    this.showDividers = false,
    this.headerTrailing,
    this.headerIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...[
          Padding(
            padding:
                padding ??
                const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
            child: Row(
              children: [
                if (headerIcon != null) ...[
                  Icon(headerIcon, size: 18, color: colorScheme.primary),
                  AppSpacing.horizontalGapSm,
                ],
                Expanded(
                  child: Text(
                    title!.toUpperCase(),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                if (headerTrailing != null) headerTrailing!,
              ],
            ),
          ),
          SizedBox(height: spacing),
        ],
        if (showDividers)
          ...List.generate(children.length * 2 - 1, (index) {
            if (index.isOdd) {
              return Divider(
                height: 1,
                indent: AppSpacing.lg,
                endIndent: AppSpacing.lg,
              );
            }
            return children[index ~/ 2];
          })
        else
          ...children
              .expand((child) => [child, SizedBox(height: spacing)])
              .take(children.length * 2 - 1),
      ],
    );
  }
}

/// A styled list tile with consistent design tokens.
class AppListTile extends StatelessWidget {
  /// Tile title.
  final String title;

  /// Tile subtitle.
  final String? subtitle;

  /// Leading widget (usually an icon or avatar).
  final Widget? leading;

  /// Trailing widget.
  final Widget? trailing;

  /// Called when the tile is tapped.
  final VoidCallback? onTap;

  /// Called when the tile is long-pressed.
  final VoidCallback? onLongPress;

  /// Content padding.
  final EdgeInsets? contentPadding;

  /// Whether the tile is selected.
  final bool selected;

  /// Whether the tile is enabled.
  final bool enabled;

  /// Whether to show a disclosure indicator.
  final bool showDisclosure;

  const AppListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.contentPadding,
    this.selected = false,
    this.enabled = true,
    this.showDisclosure = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget? effectiveTrailing = trailing;
    if (showDisclosure && trailing == null) {
      effectiveTrailing = Icon(
        Icons.chevron_right,
        color: colorScheme.onSurfaceVariant,
      );
    }

    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: leading,
      trailing: effectiveTrailing,
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      contentPadding: contentPadding ?? AppSpacing.listItemPadding,
      selected: selected,
      enabled: enabled,
      selectedTileColor: colorScheme.secondaryContainer.withValues(alpha: 0.5),
    );
  }
}

/// A decorated container for grouping content.
class AppContainer extends StatelessWidget {
  /// Container child.
  final Widget child;

  /// Container padding.
  final EdgeInsets? padding;

  /// Container margin.
  final EdgeInsets? margin;

  /// Container decoration.
  final BoxDecoration? decoration;

  /// Container color.
  final Color? color;

  /// Border radius.
  final BorderRadius? borderRadius;

  /// Whether to show a border.
  final bool bordered;

  const AppContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.decoration,
    this.color,
    this.borderRadius,
    this.bordered = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final effectiveDecoration =
        decoration ??
        BoxDecoration(
          color: color ?? colorScheme.surfaceContainerHighest,
          borderRadius: borderRadius ?? AppRadii.borderRadiusMd,
          border: bordered
              ? Border.all(color: colorScheme.outlineVariant)
              : null,
        );

    return Container(
      padding: padding ?? AppSurfaces.cardPaddingStandard,
      margin: margin,
      decoration: effectiveDecoration,
      child: child,
    );
  }
}

/// A themed divider with configurable thickness.
class AppDivider extends StatelessWidget {
  /// Divider thickness.
  final double? thickness;

  /// Horizontal indent from the start.
  final double? indent;

  /// Horizontal indent from the end.
  final double? endIndent;

  /// Divider color.
  final Color? color;

  /// Divider height (total space including divider).
  final double? height;

  /// Whether this is a section divider (thicker).
  final bool isSection;

  const AppDivider({
    super.key,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.height,
    this.isSection = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isSection) {
      return Container(
        height: height ?? AppSurfaces.dividerSection,
        color: color ?? colorScheme.surfaceContainerHighest,
      );
    }

    return Divider(
      thickness: thickness ?? AppSurfaces.dividerStandard,
      indent: indent,
      endIndent: endIndent,
      color: color ?? colorScheme.outlineVariant,
      height: height ?? 1,
    );
  }
}
