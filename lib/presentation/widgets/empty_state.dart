import 'package:flutter/material.dart';
import 'package:app_template/presentation/theme/spacing.dart';

/// An empty state display widget.
///
/// Displays a centered message with an icon and optional action button.
/// Uses semantic spacing from design tokens.
class EmptyState extends StatelessWidget {
  /// The message to display.
  final String message;

  /// Optional title above the message.
  final String? title;

  /// Optional action button label.
  final String? actionLabel;

  /// Callback when the action button is pressed.
  final VoidCallback? onAction;

  /// The icon to display.
  final IconData icon;

  /// The size of the icon.
  final double iconSize;

  /// Optional secondary action label.
  final String? secondaryActionLabel;

  /// Callback for secondary action.
  final VoidCallback? onSecondaryAction;

  const EmptyState({
    super.key,
    required this.message,
    this.title,
    this.actionLabel,
    this.onAction,
    this.icon = Icons.inbox_outlined,
    this.iconSize = 80,
    this.secondaryActionLabel,
    this.onSecondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon container with subtle background
              Container(
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: iconSize,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),

              AppSpacing.verticalGapXl,

              // Optional title
              if (title != null) ...[
                Text(
                  title!,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppSpacing.verticalGapSm,
              ],

              // Message
              Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),

              // Primary action button
              if (actionLabel != null && onAction != null) ...[
                AppSpacing.verticalGapXl,
                FilledButton(onPressed: onAction, child: Text(actionLabel!)),
              ],

              // Secondary action button
              if (secondaryActionLabel != null &&
                  onSecondaryAction != null) ...[
                AppSpacing.verticalGapSm,
                TextButton(
                  onPressed: onSecondaryAction,
                  child: Text(secondaryActionLabel!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// A compact empty state for use in smaller spaces.
class CompactEmptyState extends StatelessWidget {
  /// The message to display.
  final String message;

  /// The icon to display.
  final IconData icon;

  /// Optional action label.
  final String? actionLabel;

  /// Callback when the action is pressed.
  final VoidCallback? onAction;

  const CompactEmptyState({
    super.key,
    required this.message,
    this.icon = Icons.inbox_outlined,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          Icon(icon, size: 32, color: colorScheme.onSurfaceVariant),
          AppSpacing.horizontalGapMd,
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          if (actionLabel != null && onAction != null)
            TextButton(onPressed: onAction, child: Text(actionLabel!)),
        ],
      ),
    );
  }
}
