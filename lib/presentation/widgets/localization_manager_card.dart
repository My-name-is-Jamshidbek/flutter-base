import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/core/config/app_settings.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';

/// Language option data class.
class LanguageOption {
  final String code;
  final String name;
  final String nativeName;
  final String? flag;

  const LanguageOption({
    required this.code,
    required this.name,
    required this.nativeName,
    this.flag,
  });
}

/// Supported languages in the app.
const supportedLanguages = [
  LanguageOption(
    code: 'en',
    name: 'English',
    nativeName: 'English',
    flag: '🇺🇸',
  ),
  LanguageOption(
    code: 'ru',
    name: 'Russian',
    nativeName: 'Русский',
    flag: '🇷🇺',
  ),
  LanguageOption(
    code: 'uz',
    name: 'Uzbek',
    nativeName: 'O\'zbekcha',
    flag: '🇺🇿',
  ),
];

/// A card widget for managing localization settings.
///
/// Displays current language and allows switching between
/// supported languages via a popup dialog.
class LocalizationManagerCard extends ConsumerWidget {
  const LocalizationManagerCard({super.key});

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
                Icon(Icons.language, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  l10n.language,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // System option
          _LanguageOption(
            flag: '🌐',
            title: 'System',
            subtitle: 'Use device language',
            isSelected: settings.locale == null,
            onTap: () => settingsNotifier.setLocale(null),
          ),
          // Language options
          ...supportedLanguages.map(
            (lang) => _LanguageOption(
              flag: lang.flag ?? '🌍',
              title: lang.nativeName,
              subtitle: lang.name,
              isSelected: settings.locale?.languageCode == lang.code,
              onTap: () => settingsNotifier.setLocale(Locale(lang.code)),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String flag;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.flag,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Text(flag, style: const TextStyle(fontSize: 24)),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? theme.colorScheme.primary : null,
          fontWeight: isSelected ? FontWeight.w600 : null,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: theme.colorScheme.primary)
          : const Icon(Icons.circle_outlined),
      onTap: onTap,
    );
  }
}

/// Shows a dialog for selecting language.
Future<Locale?> showLanguageDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  final theme = Theme.of(context);

  return showModalBottomSheet<Locale?>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.8,
      expand: false,
      builder: (context, scrollController) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Text(
              l10n.selectLanguage,
              style: theme.textTheme.headlineSmall,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [
                ListTile(
                  leading: const Text('🌐', style: TextStyle(fontSize: 24)),
                  title: const Text('System'),
                  subtitle: const Text('Use device language'),
                  onTap: () => Navigator.pop(context, null),
                ),
                ...supportedLanguages.map(
                  (lang) => ListTile(
                    leading: Text(
                      lang.flag ?? '🌍',
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(lang.nativeName),
                    subtitle: Text(lang.name),
                    onTap: () => Navigator.pop(context, Locale(lang.code)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

/// A compact language switcher tile for use in lists.
class LanguageSwitcherTile extends ConsumerWidget {
  const LanguageSwitcherTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(appSettingsProvider);
    final settingsNotifier = ref.read(appSettingsProvider.notifier);

    return ListTile(
      leading: Text(
        _getCurrentLanguageFlag(settings.locale),
        style: const TextStyle(fontSize: 24),
      ),
      title: Text(l10n.language),
      subtitle: Text(_getCurrentLanguageName(settings.locale)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () async {
        final result = await showLanguageDialog(context);
        // null means system, so we need to differentiate from "cancelled"
        settingsNotifier.setLocale(result);
      },
    );
  }

  String _getCurrentLanguageName(Locale? locale) {
    if (locale == null) return 'System';
    final lang = supportedLanguages.firstWhere(
      (l) => l.code == locale.languageCode,
      orElse: () => supportedLanguages.first,
    );
    return lang.nativeName;
  }

  String _getCurrentLanguageFlag(Locale? locale) {
    if (locale == null) return '🌐';
    final lang = supportedLanguages.firstWhere(
      (l) => l.code == locale.languageCode,
      orElse: () => supportedLanguages.first,
    );
    return lang.flag ?? '🌍';
  }
}

/// Get the current language name.
String getCurrentLanguageName(Locale? locale) {
  if (locale == null) return 'System';
  final lang = supportedLanguages.firstWhere(
    (l) => l.code == locale.languageCode,
    orElse: () => supportedLanguages.first,
  );
  return lang.nativeName;
}

/// Get the current language flag.
String getCurrentLanguageFlag(Locale? locale) {
  if (locale == null) return '🌐';
  final lang = supportedLanguages.firstWhere(
    (l) => l.code == locale.languageCode,
    orElse: () => supportedLanguages.first,
  );
  return lang.flag ?? '🌍';
}
