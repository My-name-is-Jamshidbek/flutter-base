import 'package:flutter/material.dart';
import 'package:app_template/presentation/theme/theme.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';

/// An error display widget with retry button.
///
/// Displays an error message with an icon and optional retry action.
/// Uses foundations: AppIcon, AppIconSizes, AppSpacing, AppFilledButton, AppTextButton.
class ErrorDisplay extends StatelessWidget {
  /// The error message to display.
  final String? message;

  /// Optional title above the message.
  final String? title;

  /// Callback when the retry button is pressed.
  final VoidCallback? onRetry;

  /// The icon to display.
  final IconData icon;

  /// Custom retry button label.
  final String? retryLabel;

  /// Optional secondary action label.
  final String? secondaryActionLabel;

  /// Callback for secondary action (e.g., "Go Back").
  final VoidCallback? onSecondaryAction;

  const ErrorDisplay({
    super.key,
    this.message,
    this.title,
    this.onRetry,
    this.icon = Icons.error_outline,
    this.retryLabel,
    this.secondaryActionLabel,
    this.onSecondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Error icon with background
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer,
                  shape: BoxShape.circle,
                ),
                child: AppIcon.error(icon, size: AppIconSizes.massive),
              ),

              AppSpacing.verticalGapXl,

              // Title
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

              // Error message
              Text(
                message ?? l10n.errorGeneric,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),

              // Retry button
              if (onRetry != null) ...[
                AppSpacing.verticalGapXl,
                AppFilledButton(
                  label: retryLabel ?? l10n.retry,
                  onPressed: onRetry,
                  icon: Icons.refresh,
                  size: AppButtonSize.medium,
                ),
              ],

              // Secondary action
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

/// A compact error display for use in smaller spaces.
class CompactErrorDisplay extends StatelessWidget {
  /// The error message to display.
  final String? message;

  /// The icon to display.
  final IconData icon;

  /// Callback when the retry button is pressed.
  final VoidCallback? onRetry;

  const CompactErrorDisplay({
    super.key,
    this.message,
    this.icon = Icons.error_outline,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withValues(alpha: 0.5),
        borderRadius: AppRadii.borderRadiusMd,
      ),
      child: Row(
        children: [
          AppIcon.error(icon, size: AppIconSizes.standard),
          AppSpacing.horizontalGapMd,
          Expanded(
            child: Text(
              message ?? l10n.errorGeneric,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onErrorContainer,
              ),
            ),
          ),
          if (onRetry != null)
            IconButton(
              onPressed: onRetry,
              icon: AppIcon.error(Icons.refresh, size: AppIconSizes.standard),
              tooltip: l10n.retry,
            ),
        ],
      ),
    );
  }
}

/// An inline error message for form fields or small sections.
class InlineError extends StatelessWidget {
  /// The error message to display.
  final String message;

  const InlineError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xs),
      child: Row(
        children: [
          AppIcon.error(Icons.error, size: AppIconSizes.sm),
          AppSpacing.horizontalGapXs,
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
