import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_template/core/di/providers.dart';

/// Keys for storing settings in SharedPreferences.
abstract class SettingsKeys {
  static const String themeMode = 'theme_mode';
  static const String locale = 'locale';
}

/// App settings state.
class AppSettings {
  final ThemeMode themeMode;
  final Locale? locale;

  const AppSettings({this.themeMode = ThemeMode.system, this.locale});

  AppSettings copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    bool clearLocale = false,
  }) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      locale: clearLocale ? null : (locale ?? this.locale),
    );
  }
}

/// App settings notifier for managing theme and locale.
class AppSettingsNotifier extends Notifier<AppSettings> {
  @override
  AppSettings build() {
    _loadSettings();
    return const AppSettings();
  }

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  Future<void> _loadSettings() async {
    final themeModeIndex = _prefs.getInt(SettingsKeys.themeMode);
    final localeCode = _prefs.getString(SettingsKeys.locale);

    state = AppSettings(
      themeMode: themeModeIndex != null
          ? ThemeMode.values[themeModeIndex]
          : ThemeMode.system,
      locale: localeCode != null ? Locale(localeCode) : null,
    );
  }

  /// Set the theme mode.
  Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setInt(SettingsKeys.themeMode, mode.index);
    state = state.copyWith(themeMode: mode);
  }

  /// Set the locale.
  Future<void> setLocale(Locale? locale) async {
    if (locale != null) {
      await _prefs.setString(SettingsKeys.locale, locale.languageCode);
    } else {
      await _prefs.remove(SettingsKeys.locale);
    }
    state = state.copyWith(locale: locale, clearLocale: locale == null);
  }

  /// Toggle between light and dark mode.
  Future<void> toggleDarkMode() async {
    final newMode = state.themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    await setThemeMode(newMode);
  }

  /// Check if dark mode is enabled.
  bool get isDarkMode => state.themeMode == ThemeMode.dark;
}

/// Provider for app settings.
final appSettingsProvider = NotifierProvider<AppSettingsNotifier, AppSettings>(
  AppSettingsNotifier.new,
);

/// Provider for theme mode only.
final themeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(appSettingsProvider).themeMode;
});

/// Provider for locale only.
final localeProvider = Provider<Locale?>((ref) {
  return ref.watch(appSettingsProvider).locale;
});
