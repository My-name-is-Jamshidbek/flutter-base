import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/router/app_router.dart';
import 'package:app_template/presentation/theme/theme.dart';
import 'package:app_template/presentation/widgets/widgets.dart';

/// Counter state provider.
final counterProvider = StateProvider<int>((ref) => 0);

/// Home screen of the application.
///
/// Demonstrates the use of design tokens and foundations for consistent styling.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const AppIcon(Icons.settings_outlined),
            tooltip: l10n.settingsTitle,
            onPressed: () => context.push(Routes.settings),
          ),
          AppSpacing.horizontalGapSm,
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome Card
              _WelcomeCard(l10n: l10n),

              AppSpacing.verticalGapLg,

              // Counter Section
              _CounterCard(counter: counter, l10n: l10n),

              AppSpacing.verticalGapLg,

              // Quick Actions Section
              _QuickActionsSection(l10n: l10n),

              AppSpacing.verticalGapLg,

              // Demo Widgets Section
              _DemoWidgetsSection(l10n: l10n),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ref.read(counterProvider.notifier).state++,
        icon: const AppIcon(Icons.add, size: AppIconSizes.button),
        label: Text(l10n.increment),
      ),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  final AppLocalizations l10n;

  const _WelcomeCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = this.l10n;

    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Row(
        children: [
          AppIconBadge.primary(icon: Icons.waving_hand, size: AppIconSizes.lg),
          AppSpacing.horizontalGapLg,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.welcomeMessage,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSpacing.verticalGapXs,
                Text(
                  l10n.homeSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CounterCard extends StatelessWidget {
  final int counter;
  final AppLocalizations l10n;

  const _CounterCard({required this.counter, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = this.l10n;

    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$counter',
              style: theme.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          AppSpacing.verticalGapLg,
          Text(
            l10n.counterLabel,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          AppSpacing.verticalGapSm,
          Text(
            l10n.homeCounterHint,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionsSection extends StatelessWidget {
  final AppLocalizations l10n;

  const _QuickActionsSection({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppSection(
      title: l10n.quickActionsTitle,
      children: [
        Row(
          children: [
            Expanded(
              child: _ActionCard(
                icon: Icons.palette_outlined,
                label: l10n.themeMode,
                color: colorScheme.tertiary,
                onTap: () => context.push(Routes.settings),
              ),
            ),
            AppSpacing.horizontalGapMd,
            Expanded(
              child: _ActionCard(
                icon: Icons.language,
                label: l10n.language,
                color: colorScheme.secondary,
                onTap: () => context.push(Routes.settings),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: AppRadii.borderRadiusMd,
            ),
            child: AppIcon(icon, color: color, size: AppIconSizes.lg),
          ),
          AppSpacing.verticalGapMd,
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _DemoWidgetsSection extends StatefulWidget {
  final AppLocalizations l10n;

  const _DemoWidgetsSection({required this.l10n});

  @override
  State<_DemoWidgetsSection> createState() => _DemoWidgetsSectionState();
}

class _DemoWidgetsSectionState extends State<_DemoWidgetsSection> {
  bool _showLoading = false;
  bool _showError = false;
  bool _showEmpty = false;

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;

    return AppSection(
      title: l10n.widgetDemosTitle,
      children: [
        // Toggle buttons
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            FilterChip(
              label: const Text('Loading'),
              selected: _showLoading,
              onSelected: (v) => setState(() {
                _showLoading = v;
                if (v) {
                  _showError = false;
                  _showEmpty = false;
                }
              }),
            ),
            FilterChip(
              label: const Text('Error'),
              selected: _showError,
              onSelected: (v) => setState(() {
                _showError = v;
                if (v) {
                  _showLoading = false;
                  _showEmpty = false;
                }
              }),
            ),
            FilterChip(
              label: const Text('Empty'),
              selected: _showEmpty,
              onSelected: (v) => setState(() {
                _showEmpty = v;
                if (v) {
                  _showLoading = false;
                  _showError = false;
                }
              }),
            ),
          ],
        ),

        AppSpacing.verticalGapMd,

        // Demo content
        AppCard(child: SizedBox(height: 200, child: _buildDemoContent(l10n))),

        AppSpacing.verticalGapLg,

        // Skeleton demo
        _SkeletonDemo(l10n: l10n),
      ],
    );
  }

  Widget _buildDemoContent(AppLocalizations l10n) {
    if (_showLoading) {
      return LoadingIndicator(message: l10n.loadingData);
    }

    if (_showError) {
      return CompactErrorDisplay(
        message: l10n.somethingWentWrong,
        onRetry: () => setState(() => _showError = false),
      );
    }

    if (_showEmpty) {
      return CompactEmptyState(
        icon: Icons.inbox_outlined,
        message: l10n.noItemsMessage,
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon.muted(Icons.touch_app_outlined, size: AppIconSizes.xhuge),
          AppSpacing.verticalGapMd,
          Text(
            l10n.selectStateToPreview,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonDemo extends StatelessWidget {
  final AppLocalizations l10n;

  const _SkeletonDemo({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.skeletonLoadingTitle,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        AppSpacing.verticalGapSm,
        AppCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              const ListItemSkeleton(showLeading: true, showTrailing: true),
              const AppDivider(),
              const ListItemSkeleton(showLeading: true),
              const AppDivider(),
              const ListItemSkeleton(showLeading: true, showTrailing: true),
            ],
          ),
        ),
      ],
    );
  }
}
