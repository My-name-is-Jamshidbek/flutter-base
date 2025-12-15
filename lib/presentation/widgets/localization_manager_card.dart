import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/core/config/app_settings.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/theme/spacing.dart';
import 'package:app_template/presentation/theme/radii.dart';

/// Language option data class.
class LanguageOption {
  /// The language code (e.g., 'en', 'ru', 'uz').
  final String code;

  /// The English name of the language.
  final String name;

  /// The native name of the language.
  final String nativeName;

  /// Optional flag emoji.
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
/// supported languages.
/// Uses semantic spacing and design tokens.
class LocalizationManagerCard extends ConsumerWidget {
  const LocalizationManagerCard({super.key});

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
                    Icons.language,
                    color: colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                ),
                AppSpacing.horizontalGapMd,
                Text(
                  l10n.language,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
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

          AppSpacing.verticalGapSm,
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
    final colorScheme = theme.colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xxs,
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          borderRadius: AppRadii.borderRadiusSm,
        ),
        alignment: Alignment.center,
        child: Text(flag, style: const TextStyle(fontSize: 20)),
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

/// Shows a bottom sheet dialog for selecting language.
Future<Locale?> showLanguageDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context);
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
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.sm,
            ),
            child: Text(
              l10n.selectLanguage,
              style: theme.textTheme.headlineSmall,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: EdgeInsets.zero,
              children: [
                _LanguageDialogOption(
                  flag: '🌐',
                  title: 'System',
                  subtitle: 'Use device language',
                  onTap: () => Navigator.pop(context, null),
                ),
                ...supportedLanguages.map(
                  (lang) => _LanguageDialogOption(
                    flag: lang.flag ?? '🌍',
                    title: lang.nativeName,
                    subtitle: lang.name,
                    onTap: () => Navigator.pop(context, Locale(lang.code)),
                  ),
                ),
                AppSpacing.verticalGapLg,
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _LanguageDialogOption extends StatelessWidget {
  final String flag;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _LanguageDialogOption({
    required this.flag,
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
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: AppRadii.borderRadiusSm,
        ),
        alignment: Alignment.center,
        child: Text(flag, style: const TextStyle(fontSize: 20)),
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

/// A compact language switcher tile for use in lists.
class LanguageSwitcherTile extends ConsumerWidget {
  const LanguageSwitcherTile({super.key});

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
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: AppRadii.borderRadiusSm,
        ),
        alignment: Alignment.center,
        child: Text(
          getCurrentLanguageFlag(settings.locale),
          style: const TextStyle(fontSize: 20),
        ),
      ),
      title: Text(l10n.language),
      subtitle: Text(getCurrentLanguageName(settings.locale)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () async {
        final result = await showLanguageDialog(context);
        settingsNotifier.setLocale(result);
      },
    );
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
