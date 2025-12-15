import 'package:flutter/material.dart';
import 'package:app_template/presentation/theme/spacing.dart';
import 'package:app_template/presentation/theme/radii.dart';

/// A loading indicator widget with optional message.
///
/// Displays a circular progress indicator with optional loading message.
/// Uses semantic spacing from design tokens.
class LoadingIndicator extends StatelessWidget {
  /// Optional message to display below the indicator.
  final String? message;

  /// Custom color for the progress indicator.
  final Color? color;

  /// Size of the progress indicator.
  final double size;

  /// Stroke width of the progress indicator.
  final double strokeWidth;

  const LoadingIndicator({
    super.key,
    this.message,
    this.color,
    this.size = 48,
    this.strokeWidth = 4,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                color: color ?? colorScheme.primary,
                strokeWidth: strokeWidth,
              ),
            ),
            if (message != null) ...[
              AppSpacing.verticalGapLg,
              Text(
                message!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A compact inline loading indicator.
class InlineLoadingIndicator extends StatelessWidget {
  /// Optional message to display next to the indicator.
  final String? message;

  /// Custom color for the progress indicator.
  final Color? color;

  /// Size of the progress indicator.
  final double size;

  const InlineLoadingIndicator({
    super.key,
    this.message,
    this.color,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            color: color ?? colorScheme.primary,
            strokeWidth: 2,
          ),
        ),
        if (message != null) ...[
          AppSpacing.horizontalGapMd,
          Text(
            message!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

/// A loading overlay that can be placed over content.
class LoadingOverlay extends StatelessWidget {
  /// The child widget to display behind the overlay.
  final Widget child;

  /// Whether the overlay is visible.
  final bool isLoading;

  /// Optional loading message.
  final String? message;

  /// Background opacity of the overlay.
  final double opacity;

  const LoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.message,
    this.opacity = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: colorScheme.surface.withValues(alpha: opacity),
              child: LoadingIndicator(message: message),
            ),
          ),
      ],
    );
  }
}

/// A shimmer/skeleton loading placeholder.
class ShimmerPlaceholder extends StatefulWidget {
  /// Width of the placeholder.
  final double? width;

  /// Height of the placeholder.
  final double height;

  /// Border radius of the placeholder.
  final BorderRadius? borderRadius;

  const ShimmerPlaceholder({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius,
  });

  @override
  State<ShimmerPlaceholder> createState() => _ShimmerPlaceholderState();
}

class _ShimmerPlaceholderState extends State<ShimmerPlaceholder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: -1, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? AppRadii.borderRadiusSm,
            gradient: LinearGradient(
              begin: Alignment(_animation.value - 1, 0),
              end: Alignment(_animation.value, 0),
              colors: [
                colorScheme.surfaceContainerHighest,
                colorScheme.surfaceContainerLow,
                colorScheme.surfaceContainerHighest,
              ],
              stops: const [0, 0.5, 1],
            ),
          ),
        );
      },
    );
  }
}

/// A skeleton loader for list items.
class ListItemSkeleton extends StatelessWidget {
  /// Whether to show a leading circle (avatar).
  final bool showLeading;

  /// Whether to show a trailing widget.
  final bool showTrailing;

  /// Number of subtitle lines.
  final int subtitleLines;

  const ListItemSkeleton({
    super.key,
    this.showLeading = true,
    this.showTrailing = false,
    this.subtitleLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.listItemPadding,
      child: Row(
        children: [
          if (showLeading) ...[
            const ShimmerPlaceholder(
              width: 40,
              height: 40,
              borderRadius: AppRadii.borderRadiusCircular,
            ),
            AppSpacing.horizontalGapMd,
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerPlaceholder(width: 120, height: 16),
                AppSpacing.verticalGapXs,
                ...List.generate(
                  subtitleLines,
                  (index) => Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xxs),
                    child: ShimmerPlaceholder(
                      width: index == subtitleLines - 1 ? 80 : double.infinity,
                      height: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (showTrailing) ...[
            AppSpacing.horizontalGapMd,
            const ShimmerPlaceholder(width: 24, height: 24),
          ],
        ],
      ),
    );
  }
}
