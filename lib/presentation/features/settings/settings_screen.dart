import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/theme/spacing.dart';
import 'package:app_template/presentation/theme/radii.dart';
import 'package:app_template/presentation/widgets/widgets.dart';

/// Settings screen of the application.
///
/// Provides access to app settings including theme, language,
/// and other preferences. Uses design tokens for consistent styling.
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
          _SectionHeader(
            title: l10n.appearanceSection,
            icon: Icons.palette_outlined,
          ),
          AppSpacing.verticalGapSm,

          // Theme Manager Card
          const ThemeManagerCard(),

          AppSpacing.verticalGapSm,

          // Localization Manager Card
          const LocalizationManagerCard(),

          AppSpacing.verticalGapXl,

          // Preferences Section
          _SectionHeader(title: 'Preferences', icon: Icons.tune),
          AppSpacing.verticalGapSm,

          _PreferencesCard(),

          AppSpacing.verticalGapXl,

          // About Section
          _SectionHeader(title: l10n.aboutSection, icon: Icons.info_outline),
          AppSpacing.verticalGapSm,

          _AboutCard(l10n: l10n),

          AppSpacing.verticalGapXl,

          // App Info Footer
          _AppInfoFooter(l10n: l10n),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: colorScheme.primary),
          AppSpacing.horizontalGapSm,
          Text(
            title.toUpperCase(),
            style: theme.textTheme.labelMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _PreferencesCard extends StatefulWidget {
  @override
  State<_PreferencesCard> createState() => _PreferencesCardState();
}

class _PreferencesCardState extends State<_PreferencesCard> {
  bool _notificationsEnabled = true;
  bool _analyticsEnabled = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        children: [
          SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
            secondary: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: AppRadii.borderRadiusSm,
              ),
              child: Icon(
                Icons.notifications_outlined,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            title: const Text('Notifications'),
            subtitle: const Text('Receive push notifications'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() => _notificationsEnabled = value);
            },
          ),
          const Divider(
            height: 1,
            indent: AppSpacing.lg,
            endIndent: AppSpacing.lg,
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
            secondary: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: AppRadii.borderRadiusSm,
              ),
              child: Icon(
                Icons.analytics_outlined,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            title: const Text('Analytics'),
            subtitle: const Text('Help improve the app'),
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

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        children: [
          // Version
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
            leading: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: AppRadii.borderRadiusSm,
              ),
              child: Icon(
                Icons.info_outline,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            title: Text(l10n.version),
            subtitle: const Text('1.0.0 (Build 1)'),
          ),
          const Divider(
            height: 1,
            indent: AppSpacing.lg,
            endIndent: AppSpacing.lg,
          ),

          // Licenses
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
            leading: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: AppRadii.borderRadiusSm,
              ),
              child: Icon(
                Icons.description_outlined,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            title: Text(l10n.licenses),
            subtitle: const Text('Open source licenses'),
            trailing: const Icon(Icons.chevron_right),
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
                    child: Icon(
                      Icons.flutter_dash,
                      size: 48,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              );
            },
          ),
          const Divider(
            height: 1,
            indent: AppSpacing.lg,
            endIndent: AppSpacing.lg,
          ),

          // Privacy Policy
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
            leading: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: AppRadii.borderRadiusSm,
              ),
              child: Icon(
                Icons.privacy_tip_outlined,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.open_in_new, size: 18),
            onTap: () {
              // TODO: Open privacy policy URL
            },
          ),
          const Divider(
            height: 1,
            indent: AppSpacing.lg,
            endIndent: AppSpacing.lg,
          ),

          // Terms of Service
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
            leading: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: AppRadii.borderRadiusSm,
              ),
              child: Icon(
                Icons.article_outlined,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.open_in_new, size: 18),
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
          child: Icon(Icons.flutter_dash, size: 32, color: colorScheme.primary),
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
          'Made with ❤️ using Flutter',
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.outline,
          ),
        ),
        AppSpacing.verticalGapXl,
      ],
    );
  }
}
