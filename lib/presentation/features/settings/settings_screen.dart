import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/theme/theme.dart';
import 'package:app_template/presentation/widgets/widgets.dart';

/// Settings screen of the application.
///
/// Provides access to app settings including theme, language,
/// and other preferences. Uses foundations for consistent styling.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          // Appearance Section
          AppSection(
            title: l10n.appearanceSection,
            headerIcon: Icons.palette_outlined,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            children: const [ThemeManagerCard(), LocalizationManagerCard()],
          ),

          AppSpacing.verticalGapXl,

          // Preferences Section
          AppSection(
            title: l10n.preferencesSection,
            headerIcon: Icons.tune,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            children: [_PreferencesCard(l10n: l10n)],
          ),

          AppSpacing.verticalGapXl,

          // About Section
          AppSection(
            title: l10n.aboutSection,
            headerIcon: Icons.info_outline,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            children: [_AboutCard(l10n: l10n)],
          ),

          AppSpacing.verticalGapXl,

          // App Info Footer
          _AppInfoFooter(l10n: l10n),
        ],
      ),
    );
  }
}

class _PreferencesCard extends StatefulWidget {
  final AppLocalizations l10n;

  const _PreferencesCard({required this.l10n});

  @override
  State<_PreferencesCard> createState() => _PreferencesCardState();
}

class _PreferencesCardState extends State<_PreferencesCard> {
  bool _notificationsEnabled = true;
  bool _analyticsEnabled = false;

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
            secondary: AppIconBadge.surface(
              icon: Icons.notifications_outlined,
              size: AppIconSizes.md,
            ),
            title: Text(l10n.notifications),
            subtitle: Text(
              l10n.notificationsSubtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() => _notificationsEnabled = value);
            },
          ),
          const AppDivider(indent: AppSpacing.lg, endIndent: AppSpacing.lg),
          SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
            secondary: AppIconBadge.surface(
              icon: Icons.analytics_outlined,
              size: AppIconSizes.md,
            ),
            title: Text(l10n.analytics),
            subtitle: Text(
              l10n.analyticsSubtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            value: _analyticsEnabled,
            onChanged: (value) {
              setState(() => _analyticsEnabled = value);
            },
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final AppLocalizations l10n;

  const _AboutCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          // Version
          AppListTile(
            leading: AppIconBadge.surface(
              icon: Icons.info_outline,
              size: AppIconSizes.md,
            ),
            title: l10n.version,
            subtitle: l10n.versionInfo('1.0.0', '1'),
          ),
          const AppDivider(indent: AppSpacing.lg, endIndent: AppSpacing.lg),

          // Licenses
          AppListTile(
            leading: AppIconBadge.surface(
              icon: Icons.description_outlined,
              size: AppIconSizes.md,
            ),
            title: l10n.licenses,
            subtitle: l10n.openSourceLicenses,
            showDisclosure: true,
            onTap: () {
              showLicensePage(
                context: context,
                applicationName: l10n.appTitle,
                applicationVersion: '1.0.0',
                applicationIcon: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: AppRadii.borderRadiusLg,
                    ),
                    child: AppIcon.primary(
                      Icons.flutter_dash,
                      size: AppIconSizes.xhuge,
                    ),
                  ),
                ),
              );
            },
          ),
          const AppDivider(indent: AppSpacing.lg, endIndent: AppSpacing.lg),

          // Privacy Policy
          AppListTile(
            leading: AppIconBadge.surface(
              icon: Icons.privacy_tip_outlined,
              size: AppIconSizes.md,
            ),
            title: l10n.privacyPolicy,
            trailing: AppIcon.muted(Icons.open_in_new, size: AppIconSizes.sm),
            onTap: () {
              // TODO: Open privacy policy URL
            },
          ),
          const AppDivider(indent: AppSpacing.lg, endIndent: AppSpacing.lg),

          // Terms of Service
          AppListTile(
            leading: AppIconBadge.surface(
              icon: Icons.article_outlined,
              size: AppIconSizes.md,
            ),
            title: l10n.termsOfService,
            trailing: AppIcon.muted(Icons.open_in_new, size: AppIconSizes.sm),
            onTap: () {
              // TODO: Open terms of service URL
            },
          ),
        ],
      ),
    );
  }
}

class _AppInfoFooter extends StatelessWidget {
  final AppLocalizations l10n;

  const _AppInfoFooter({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
          child: AppIcon.primary(Icons.flutter_dash, size: AppIconSizes.xl),
        ),
        AppSpacing.verticalGapMd,
        Text(
          l10n.appTitle,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        AppSpacing.verticalGapXs,
        Text(
          l10n.madeWithFlutter,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.outline,
          ),
        ),
        AppSpacing.verticalGapXl,
      ],
    );
  }
}
