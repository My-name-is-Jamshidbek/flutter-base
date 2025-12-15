import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_template/core/di/providers.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/theme/app_theme.dart';

/// Mock classes for testing.
class MockSharedPreferences extends Mock implements SharedPreferences {}

/// Test wrapper for widget tests with all necessary providers.
class TestApp extends StatelessWidget {
  final Widget child;
  final ThemeMode themeMode;
  final Locale locale;
  final List<Override>? overrides;

  const TestApp({
    super.key,
    required this.child,
    this.themeMode = ThemeMode.light,
    this.locale = const Locale('en'),
    this.overrides,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: overrides ?? [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        locale: locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: child),
      ),
    );
  }
}

/// Pump widget with the test wrapper.
extension WidgetTesterX on WidgetTester {
  /// Pump a widget with the test app wrapper.
  Future<void> pumpApp(
    Widget widget, {
    ThemeMode themeMode = ThemeMode.light,
    Locale locale = const Locale('en'),
    List<Override>? overrides,
  }) async {
    await pumpWidget(
      TestApp(
        themeMode: themeMode,
        locale: locale,
        overrides: overrides,
        child: widget,
      ),
    );
    await pump();
  }

  /// Pump and settle with the test app wrapper.
  Future<void> pumpAppAndSettle(
    Widget widget, {
    ThemeMode themeMode = ThemeMode.light,
    Locale locale = const Locale('en'),
    List<Override>? overrides,
  }) async {
    await pumpApp(
      widget,
      themeMode: themeMode,
      locale: locale,
      overrides: overrides,
    );
    await pumpAndSettle();
  }
}

/// Setup mock SharedPreferences for testing.
Future<MockSharedPreferences> setupMockPreferences({
  Map<String, Object>? values,
}) async {
  final mock = MockSharedPreferences();

  // Setup default returns
  when(() => mock.getString(any())).thenReturn(null);
  when(() => mock.getBool(any())).thenReturn(null);
  when(() => mock.getInt(any())).thenReturn(null);
  when(() => mock.getDouble(any())).thenReturn(null);
  when(() => mock.getStringList(any())).thenReturn(null);
  when(() => mock.setString(any(), any())).thenAnswer((_) async => true);
  when(() => mock.setBool(any(), any())).thenAnswer((_) async => true);
  when(() => mock.setInt(any(), any())).thenAnswer((_) async => true);
  when(() => mock.setDouble(any(), any())).thenAnswer((_) async => true);
  when(() => mock.setStringList(any(), any())).thenAnswer((_) async => true);
  when(() => mock.remove(any())).thenAnswer((_) async => true);
  when(() => mock.clear()).thenAnswer((_) async => true);

  // Apply custom values if provided
  if (values != null) {
    for (final entry in values.entries) {
      final key = entry.key;
      final value = entry.value;
      if (value is String) {
        when(() => mock.getString(key)).thenReturn(value);
      } else if (value is bool) {
        when(() => mock.getBool(key)).thenReturn(value);
      } else if (value is int) {
        when(() => mock.getInt(key)).thenReturn(value);
      } else if (value is double) {
        when(() => mock.getDouble(key)).thenReturn(value);
      } else if (value is List<String>) {
        when(() => mock.getStringList(key)).thenReturn(value);
      }
    }
  }

  return mock;
}

/// Create provider override for SharedPreferences.
Override sharedPreferencesOverride(SharedPreferences prefs) {
  return sharedPreferencesProvider.overrideWithValue(prefs);
}
