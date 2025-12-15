import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/core/config/app_settings.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';

/// A card widget for managing theme settings.
///
/// Displays current theme mode and allows switching between
/// system, light, and dark themes via a popup dialog.
class ThemeManagerCard extends ConsumerWidget {
  const ThemeManagerCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final settings = ref.watch(appSettingsProvider);
    final settingsNotifier = ref.read(appSettingsProvider.notifier);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Icon(Icons.palette_outlined, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  l10n.themeMode,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
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
            isSelected: settings.themeMode == ThemeMode.system,
            onTap: () => settingsNotifier.setThemeMode(ThemeMode.system),
          ),
          _ThemeModeOption(
            icon: Icons.light_mode,
            title: l10n.themeModeLight,
            isSelected: settings.themeMode == ThemeMode.light,
            onTap: () => settingsNotifier.setThemeMode(ThemeMode.light),
          ),
          _ThemeModeOption(
            icon: Icons.dark_mode,
            title: l10n.themeModeDark,
            isSelected: settings.themeMode == ThemeMode.dark,
            onTap: () => settingsNotifier.setThemeMode(ThemeMode.dark),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _ThemeModeOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeModeOption({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(icon, color: isSelected ? theme.colorScheme.primary : null),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? theme.colorScheme.primary : null,
          fontWeight: isSelected ? FontWeight.w600 : null,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: theme.colorScheme.primary)
          : const Icon(Icons.circle_outlined),
      onTap: onTap,
    );
  }
}

/// Shows a dialog for selecting theme mode.
Future<ThemeMode?> showThemeModeDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Text(l10n.themeMode, style: theme.textTheme.headlineSmall),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.brightness_auto),
            title: Text(l10n.themeModeSystem),
            subtitle: const Text('Follow device settings'),
            onTap: () => Navigator.pop(context, ThemeMode.system),
          ),
          ListTile(
            leading: const Icon(Icons.light_mode),
            title: Text(l10n.themeModeLight),
            subtitle: const Text('Always use light theme'),
            onTap: () => Navigator.pop(context, ThemeMode.light),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: Text(l10n.themeModeDark),
            subtitle: const Text('Always use dark theme'),
            onTap: () => Navigator.pop(context, ThemeMode.dark),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );
}

/// A compact theme switcher tile for use in lists.
class ThemeSwitcherTile extends ConsumerWidget {
  const ThemeSwitcherTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(appSettingsProvider);
    final settingsNotifier = ref.read(appSettingsProvider.notifier);

    return ListTile(
      leading: Icon(
        settings.themeMode == ThemeMode.dark
            ? Icons.dark_mode
            : settings.themeMode == ThemeMode.light
            ? Icons.light_mode
            : Icons.brightness_auto,
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
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(appSettingsProvider);
    final settingsNotifier = ref.read(appSettingsProvider.notifier);

    return SwitchListTile(
      secondary: const Icon(Icons.dark_mode),
      title: Text(l10n.darkMode),
      subtitle: Text(l10n.darkModeSubtitle),
      value: settings.themeMode == ThemeMode.dark,
      onChanged: (value) {
        settingsNotifier.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
