import 'package:flutter/material.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// An empty state display widget.
///
/// Displays a centered message with an icon and optional action button.
/// Uses foundations: AppIcon, AppIconSizes, AppSpacing, AppFilledButton, AppTextButton.
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
              AppIconBadge.surface(icon: icon, size: AppIconSizes.xmassive),

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
                AppFilledButton(
                  label: actionLabel!,
                  onPressed: onAction,
                  size: AppButtonSize.medium,
                ),
              ],

              // Secondary action button
              if (secondaryActionLabel != null &&
                  onSecondaryAction != null) ...[
                AppSpacing.verticalGapSm,
                AppTextButton(
                  label: secondaryActionLabel!,
                  onPressed: onSecondaryAction,
                  size: AppButtonSize.medium,
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
          AppIcon.muted(icon, size: AppIconSizes.xl),
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
            AppTextButton(
              label: actionLabel!,
              onPressed: onAction,
              size: AppButtonSize.small,
            ),
        ],
      ),
    );
  }
}
