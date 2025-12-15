import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/core/config/app_settings.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/theme/spacing.dart';
import 'package:app_template/presentation/theme/radii.dart';

/// A card widget for managing theme settings.
///
/// Displays current theme mode and allows switching between
/// system, light, and dark themes.
/// Uses semantic spacing and design tokens.
class ThemeManagerCard extends ConsumerWidget {
  const ThemeManagerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = ref.watch(appSettingsProvider);
    final settingsNotifier = ref.read(appSettingsProvider.notifier);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
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
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: AppRadii.borderRadiusSm,
                  ),
                  child: Icon(
                    Icons.palette_outlined,
                    color: colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
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

          const Divider(height: 1),

          // Theme mode options
          _ThemeModeOption(
            icon: Icons.brightness_auto,
            title: l10n.themeModeSystem,
            subtitle: 'Follow device settings',
            isSelected: settings.themeMode == ThemeMode.system,
            onTap: () => settingsNotifier.setThemeMode(ThemeMode.system),
          ),
          _ThemeModeOption(
            icon: Icons.light_mode,
            title: l10n.themeModeLight,
            subtitle: 'Always use light theme',
            isSelected: settings.themeMode == ThemeMode.light,
            onTap: () => settingsNotifier.setThemeMode(ThemeMode.light),
          ),
          _ThemeModeOption(
            icon: Icons.dark_mode,
            title: l10n.themeModeDark,
            subtitle: 'Always use dark theme',
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xxs,
      ),
      leading: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          borderRadius: AppRadii.borderRadiusSm,
        ),
        child: Icon(
          icon,
          size: 20,
          color: isSelected
              ? colorScheme.onPrimaryContainer
              : colorScheme.onSurfaceVariant,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: isSelected ? colorScheme.primary : colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: colorScheme.primary)
          : Icon(Icons.circle_outlined, color: colorScheme.outline),
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
          const Divider(),
          _ThemeDialogOption(
            icon: Icons.brightness_auto,
            title: l10n.themeModeSystem,
            subtitle: 'Follow device settings',
            onTap: () => Navigator.pop(context, ThemeMode.system),
          ),
          _ThemeDialogOption(
            icon: Icons.light_mode,
            title: l10n.themeModeLight,
            subtitle: 'Always use light theme',
            onTap: () => Navigator.pop(context, ThemeMode.light),
          ),
          _ThemeDialogOption(
            icon: Icons.dark_mode,
            title: l10n.themeModeDark,
            subtitle: 'Always use dark theme',
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.xxs,
      ),
      leading: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: AppRadii.borderRadiusSm,
        ),
        child: Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = ref.watch(appSettingsProvider);
    final settingsNotifier = ref.read(appSettingsProvider.notifier);

    return ListTile(
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
          _getThemeModeIcon(settings.themeMode),
          size: 20,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      title: Text(l10n.themeMode),
      subtitle: Text(_getThemeModeLabel(settings.themeMode, l10n)),
      trailing: const Icon(Icons.chevron_right),
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
      secondary: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: AppRadii.borderRadiusSm,
        ),
        child: Icon(
          Icons.dark_mode,
          size: 20,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      title: Text(l10n.darkMode),
      subtitle: Text(l10n.darkModeSubtitle),
      value: settings.themeMode == ThemeMode.dark,
      onChanged: (value) {
        settingsNotifier.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
