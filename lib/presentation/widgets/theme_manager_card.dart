import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/core/config/app_settings.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// A card widget for managing theme settings.
///
/// Displays current theme mode and allows switching between
/// system, light, and dark themes.
/// Uses foundations: AppCard, AppSection, AppIcon, AppIconSizes, AppSpacing.
class ThemeManagerCard extends ConsumerWidget {
  const ThemeManagerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final settings = ref.watch(appSettingsProvider);
    final settingsNotifier = ref.read(appSettingsProvider.notifier);

    return AppCard(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            child: Row(
              children: [
                AppIconBadge.primary(
                  icon: Icons.palette_outlined,
                  size: AppIconSizes.md,
                ),
                AppSpacing.horizontalGapMd,
                Text(
                  l10n.themeMode,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const AppDivider(),

          // Theme mode options
          _ThemeModeOption(
            icon: Icons.brightness_auto,
            title: l10n.themeModeSystem,
            subtitle: l10n.themeModeSystemSubtitle,
            isSelected: settings.themeMode == ThemeMode.system,
            onTap: () => settingsNotifier.setThemeMode(ThemeMode.system),
          ),
          _ThemeModeOption(
            icon: Icons.light_mode,
            title: l10n.themeModeLight,
            subtitle: l10n.themeModeLightSubtitle,
            isSelected: settings.themeMode == ThemeMode.light,
            onTap: () => settingsNotifier.setThemeMode(ThemeMode.light),
          ),
          _ThemeModeOption(
            icon: Icons.dark_mode,
            title: l10n.themeModeDark,
            subtitle: l10n.themeModeDarkSubtitle,
            isSelected: settings.themeMode == ThemeMode.dark,
            onTap: () => settingsNotifier.setThemeMode(ThemeMode.dark),
          ),

          AppSpacing.verticalGapSm,
        ],
      ),
    );
  }
}

class _ThemeModeOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeModeOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      leading: isSelected
          ? AppIconBadge.primary(icon: icon, size: AppIconSizes.md)
          : AppIconBadge.surface(icon: icon, size: AppIconSizes.md),
      title: title,
      subtitle: subtitle,
      trailing: isSelected
          ? AppIcon.primary(Icons.check_circle, size: AppIconSizes.standard)
          : AppIcon.muted(Icons.circle_outlined, size: AppIconSizes.standard),
      onTap: onTap,
    );
  }
}

/// Shows a bottom sheet dialog for selecting theme mode.
Future<ThemeMode?> showThemeModeDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  final theme = Theme.of(context);

  return showModalBottomSheet<ThemeMode>(
    context: context,
    showDragHandle: true,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.sm,
            ),
            child: Text(l10n.themeMode, style: theme.textTheme.headlineSmall),
          ),
          const AppDivider(),
          _ThemeDialogOption(
            icon: Icons.brightness_auto,
            title: l10n.themeModeSystem,
            subtitle: l10n.themeModeSystemSubtitle,
            onTap: () => Navigator.pop(context, ThemeMode.system),
          ),
          _ThemeDialogOption(
            icon: Icons.light_mode,
            title: l10n.themeModeLight,
            subtitle: l10n.themeModeLightSubtitle,
            onTap: () => Navigator.pop(context, ThemeMode.light),
          ),
          _ThemeDialogOption(
            icon: Icons.dark_mode,
            title: l10n.themeModeDark,
            subtitle: l10n.themeModeDarkSubtitle,
            onTap: () => Navigator.pop(context, ThemeMode.dark),
          ),
          AppSpacing.verticalGapLg,
        ],
      ),
    ),
  );
}

class _ThemeDialogOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ThemeDialogOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.xxs,
      ),
      leading: AppIconBadge.surface(icon: icon, size: AppIconSizes.md),
      title: title,
      subtitle: subtitle,
      onTap: onTap,
    );
  }
}

/// A compact theme switcher tile for use in lists.
class ThemeSwitcherTile extends ConsumerWidget {
  const ThemeSwitcherTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final settings = ref.watch(appSettingsProvider);
    final settingsNotifier = ref.read(appSettingsProvider.notifier);

    return AppListTile(
      leading: AppIconBadge.surface(
        icon: _getThemeModeIcon(settings.themeMode),
        size: AppIconSizes.md,
      ),
      title: l10n.themeMode,
      subtitle: _getThemeModeLabel(settings.themeMode, l10n),
      trailing: const AppIcon.muted(Icons.chevron_right),
      showDisclosure: false,
      onTap: () async {
        final result = await showThemeModeDialog(context);
        if (result != null) {
          settingsNotifier.setThemeMode(result);
        }
      },
    );
  }

  IconData _getThemeModeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return Icons.brightness_auto;
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
    }
  }

  String _getThemeModeLabel(ThemeMode mode, AppLocalizations l10n) {
    switch (mode) {
      case ThemeMode.system:
        return l10n.themeModeSystem;
      case ThemeMode.light:
        return l10n.themeModeLight;
      case ThemeMode.dark:
        return l10n.themeModeDark;
    }
  }
}

/// A dark mode toggle switch tile.
class DarkModeToggleTile extends ConsumerWidget {
  const DarkModeToggleTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = ref.watch(appSettingsProvider);
    final settingsNotifier = ref.read(appSettingsProvider.notifier);

    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xs,
      ),
      secondary: AppIconBadge.surface(
        icon: Icons.dark_mode,
        size: AppIconSizes.md,
      ),
      title: Text(l10n.darkMode),
      subtitle: Text(
        l10n.darkModeSubtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      value: settings.themeMode == ThemeMode.dark,
      onChanged: (value) {
        settingsNotifier.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
